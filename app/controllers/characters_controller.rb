class CharactersController < ApplicationController

  before_filter :find_dependancies, except: [:index, :new, :create, :resume_race, :resume_klass]
  #[:edit, :show, :choose_race, :choose_carac, :choose_class, :choose_features, :save_features, :choose_skills, :choose_feats, :choose_optional_fields]

  def index
    @hide_side_bloc =true
    @characters = @current_user.characters
  end

  def show
    @characters = @current_user.characters
  end

  def new
    @hide_side_bloc = true
    @character = Character.new
    @campaigns = Campaign.all
  end

  def create
    @character = Character.new(character_params)
    @character.status = 'draft'
    @character.players.each do |player|
      player.user_id = @current_user.id
    end

    if @character.save
      redirect_to choose_race_character_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :new
    end
  end

  def edit
    @characters = @current_user.characters
    @users = User.all
    @campaigns = Campaign.all
  end

  def update
    if @character.update(character_params)
      redirect_to characters_path
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :edit
    end
  end

  def choose_race
    @races = Race.all.order(:name)
  end

  def save_race
    if @character.update(character_params)
      redirect_to choose_class_character_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_race
    end
  end

  def choose_class
    @klasses = Klass.select(:id, :name, :role).all.group_by(&:role)
  end

  def save_class
    if @character.update(character_params)
      redirect_to choose_optional_fields_character_path (@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_class
    end
  end

  def choose_optional_fields
    # TODO : FAIRE UN CONTROLE SUR LE NOMBRE DE LANGUES CHOISIES
    @gods = God.all.order(:name)
    @known_languages = @character.race.known_level_1_languages
    @languages = @character.race.available_level_1_languages
    @alignment = Character::ALIGNMENT
  end

  def save_optional_fields
    params["character"]["language_ids"].delete("")
    @character.language_ids.clear
    if @character.update(character_params)
      redirect_to choose_abilities_character_path (@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_optional_fields
    end
  end

  def choose_abilities
    @char_abilities = @character.initialize_ability_bonuses
    @racial_bonus_chosen = @character.racial_bonus_chosen(@char_abilities)
    @random_abilities = Character.random_abilities
  end

  def save_abilities
    @character.assign_attributes(character_params)
    @character.calcul_abilities
    @character.status = "ability_done"
    @character.save
    if @character.update(character_params)
      redirect_to choose_features_character_path (@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_abilities
    end
  end

  def choose_features
  end

  def save_features
    if params && params["character"]
      choices = params["character"]["character_choice_ids"].values.flatten
      @character.choices.features_choices.delete_all
      features = Feature.find choices
      features.each do |f|
        choices << f.parent_feature_id unless f.parent_feature_id.nil?
      end
      choices = choices.uniq
      choices.each do |c|
        Choice.create(character: @character, feature_id: c)
      end
    end
    # Etape suivante : choix des compétences
    if @character.save
      redirect_to choose_skills_character_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_features
    end
  end

  def choose_skills
    # Récupération des bonus dynamiques apportés par les races et classes
    @race_choosable_skill_bonus = @character.race.choosable_skill_bonus_to_a
    @klass_choosable_skill_bonus = @character.klass.choosable_skills_to_a
    @character_chosen_skill = @character.chosen_skill_formation

    # Gestion des bonus apportés par des aptitudes raciales
    @bonus_from_feature = @character.show_formation_bonus_rule(@character.race.features.main_ft )

    # Initialisation des choix de compétences de classes
    @char_skills = @character.initialize_skill_bonuses(@character.race.skill_bonuses_to_a, @character.klass.required_skills_to_a, @character.ability_bonuses.joins(:ability))
    # Si le personnage existe déjà, on vérifie si les différents bonus dynamiques ont déjà été choisi
    @racial_bonus_already_chosen = @character.racial_skill_bonus_chosen?(@char_skills, @race_choosable_skill_bonus)
  end

  def save_skills
    if (@character.klass.name == 'Rôdeur')
      required_skill_chosen = false
      nature, dungeoneering = @character.skill_bonuses.joins(:skill).where(skills: {name: [:nature, :dungeoneering]}) 
      character_params[:skill_bonuses_attributes].each do |param|
        if ((nature.id.to_s == param.last["id"] || dungeoneering.id.to_s == param.last["id"]) && param.last["training"] == "5")
          required_skill_chosen = true
        end
      end
      if !required_skill_chosen
        flash[:error] = "En tant que rôdeur, vous devez choisir Exploration ou Nature"
        redirect_to choose_skills_character_path @character.id and return
      end
    end

    if (@character.klass.name == 'Voleur')
      required_skill_chosen = false
      stealth, thievery = @character.skill_bonuses.joins(:skill).where(skills: {name: [:stealth, :thievery]}) 
      character_params[:skill_bonuses_attributes].each do |param|
        if ((stealth.id.to_s == param.last["id"] || thievery.id.to_s == param.last["id"]) && param.last["training"] == "5")
          required_skill_chosen = true
        end
      end
      if !required_skill_chosen
        flash[:error] = "En tant que voleur, vous devez choisir Discrétion ou Larcin"
        redirect_to choose_skills_character_path @character.id and return
      end
    end

    @character.assign_attributes(character_params)
    @character.status = "skill_done"
    
    if @character.save
      redirect_to choose_feats_character_path (@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_skills
    end
  end

  def choose_feats
  end

  def save_feats
  end

  def destroy
    character.destroy
    redirect_to characters_path
  end

  def choose_campaign
    player = Player.find_by(user_id: @current_user.id, character_id: params[:id], campaign_id: params[:camp])
    if player
      flash[:error] = "Erreur, vous semblez avoir déjà rejoins la campagne"
    else
      player = Player.new(user_id: @current_user.id, character_id: params[:id], campaign_id: params[:camp])
    end

    if player.save
      flash[:success] = "Vous avez rejoint la campagne"
      redirect_to edit_character_path(params[:id])
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{player.errors.full_messages}"
      render :edit
    end
  end

  def remove_campaign
    player = Player.find_by(user_id: @current_user.id, character_id: params[:id], campaign_id: params[:camp])

    if player && player.delete
      flash[:success] = "Vous avez quitter la campagne"
      redirect_to edit_character_path(params[:id])
    else
      find_dependancies
      flash[:error] = "Erreur, vous semblez avoir déjà quitter la campagne"
      render :edit
    end
  end

  def resume_race
      @race = Race.find(params[:race_id])
      respond_to do |format|
          format.js
      end
  end

  def resume_klass
      @klass = Klass.find(params[:klass_id])
      respond_to do |format|
          format.js
      end
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
      :level,
      :experience,
      :parangon,
      :epic,
      :age,
      :height,
      :weight,
      :alignment,
      :divinity,
      :party,
      :user_id,
      :race_id,
      :klass_id,
      :god_id,
      :stats,
      :racial_stat_id,
      :racial_bonus_choice,
      {skill_choices: [
        :acrobatics,
        :arcana,
        :athletics,
        :bluff,
        :diplomacy,
        :dungeoneering,
        :endurance,
        :heal,
        :history,
        :insight,
        :intimidate,
        :nature,
        :perception,
        :religion,
        :stealth,
        :streetwise,
        :thievery,
        :origin
      ]},
      {game_ids:[]},
      {language_ids: []},
      {campaign_ids: []},
      :ability_bonuses_attributes => [
        :id,
        :initial_value,
        :bonus_racial,
        :level_4,
        :level_8,
        :level_11,
        :level_14,
        :level_18,
        :level_21,
        :level_24,
        :level_28
      ],
      :skill_bonuses_attributes => [
        :id,
        :racial,
        :training
      ]
      )
  end

  def find_dependancies
    @character = Character.find_by_id(params["id"])
    @abilities = @character.ability_bonuses.joins(:ability)
    @skills = @character.skill_bonuses.joins(:skill)
  end

end
