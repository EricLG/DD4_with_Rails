class CharactersController < ApplicationController

  before_filter :find_dependancies, only: [:index, :new, :edit, :show, :choose_race, :choose_carac, :choose_class, :choose_skills, :choose_feats, :choose_optional_fields]

  def index
    @hide_side_bloc =true
    @characters = @current_user.characters
  end

  def new
    @hide_side_bloc = true
    @character = Character.new
    @campaigns = Campaign.all
  end

  def choose_race
    @character = Character.find_by_id(params["character_id"])
  end

  def choose_class
    @character = Character.find_by_id(params["character_id"])
    @character.update(character_params) if params && params["character"]
  end

  def choose_optional_fields
    # TODO : FAIRE UN CONTROLE SUR LE NOMBRE DE LANGUES CHOISIES
    @character  = Character.find_by_id(params["character_id"])
    @known_languages = @character.race.known_level_1_languages
    @languages = @character.race.available_level_1_languages
    @alignment = Character::ALIGNMENT
    @character.update(character_params) if params && params["character"]
  end

  def choose_carac
    @character = Character.find_by_id(params["character_id"])
    if params && params["character"]
      params["character"]["language_ids"].delete("")
      @character.language_ids.clear
      @character.update(character_params)
    end

    # Initialize abilities for new character
    @char_abilities = @character.initialize_ability_bonuses

    @random_stats = [random_stat, random_stat, random_stat, random_stat, random_stat, random_stat].sort {|x,y| y <=> x }
  end

  def save_abilities
    @character.update(character_params)
  end

  def choose_features
    @character = Character.find_by_id(params["character_id"])
    save_abilities
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
  end

  def choose_skills
    @character = Character.find_by_id(params["character_id"])
    # Sauvegarde des features de la page précédentes
    save_features

    # Parametres du template
    @skills = Skill.get_skills
    @race_bonus_skill_available = @character.race_bonus_skill_available
    @race_bonus = Skill.new(origin: 'racial_bonus_choice') if @character.race.grant_dynamic_racial_skill_bonus
    @racial_features = @character.race.features.main_ft
    # Initialisation des choix de compétences de classes
    @klass_formations_required = @character.klass.required_skills.map(&:to_a).flatten
    @klass_formations_choices = @character.klass_formations_choices
    @race_bonus_skill_choices = @character.race_bonus_skill_choices
    @bonus_from_feature = @character.show_formation_bonus_rule(@racial_features)

    # Determination des différents bonus
    @skill_bonus = @character.skill_bonus

  end

  def save_skills
    # TODO : controle sur les formations choisies (count et formations offerte)
    formations_choice_params = character_params[:skill_choices]

    if @character.klass.name == 'Rôdeur' && !formations_choice_params.include?(:nature) && !formations_choice_params.include?(:dungeoneering)
      flash[:error] = "En tant que rôdeur, vous devez choisir soit Exploration, soit Nature"
      redirect_to character_choose_skills_path @character.id
    end
    if @character.klass.name == 'Voleur' && !formations_choice_params.include?(:stealth) && !formations_choice_params.include?(:thievery)
      flash[:error] = "En tant que voleur, vous devez choisir soit Discrétion, soit Larcin"
      redirect_to character_choose_skills_path @character.id
    end

    # Sauvegarde des choix de formations, on écrase les choix précédants
    skill_klass_formations = @character.klass_formations_choices
    skill_klass_formations.raz
    skill_klass_formations.update(formations_choice_params)

    # Sauvegarde du choix de bonus racial si la race le permet
    @character.race_bonus_skill_choices.update_racial_choice!(params['racial_bonus_choice']) if @character.race.grant_dynamic_racial_skill_bonus && params['racial_bonus_choice']

  end

  def choose_feats
    @character = Character.find_by_id(params["character_id"])
    save_skills

    # Then load all needed for feats
  end

  def create
    @character = Character.new(character_params)
    @character.status = 'draft'
    @character.players.each do |player|
      player.user_id = @current_user.id
    end

    if @character.save
      redirect_to character_choose_race_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :new
    end
  end

  def destroy
    character = Character.find_by_id(params[:id])
    character.destroy

    redirect_to characters_path
  end

  def show
    @character = Character.find_by_id(params[:id])
  end

  def edit
    @users = User.all
    @character = Character.find_by_id(params[:id])
    @campaigns = Campaign.all
  end

  def update
    @character = Character.find_by_id(params[:id])
    if @character.update(character_params)
      redirect_to characters_path
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :edit
    end
  end

  def choose_campaign
    @character = Character.find_by_id(params[:id])
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
    @character = Character.find_by_id(params[:id])
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

  def random_stat
    [dice, dice, dice, dice].sort.last(3).inject{|acc, i| acc+=i}
  end

  def dice
    rand(1..6)
  end

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
      :ability_bonuses_attributes => [:id, :initial_value, :bonus_racial]
      )
  end

  def find_dependancies
    @characters = @current_user.characters
    @gods = God.all.order(:name)
    @races = Race.all.order(:name)
    @klasses = Klass.select(:id, :name, :role).all.group_by(&:role)
    @languages = Language.all.order(:language)
  end

end
