class CharactersController < ApplicationController

  before_filter :find_dependancies, only: [:index, :new, :edit, :show, :choose_race, :choose_carac, :choose_class, :choose_skill, :choose_optional_fields]

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
    @random_stats = [random_stat, random_stat, random_stat, random_stat, random_stat, random_stat].sort {|x,y| y <=> x }
    @random_stats
  end

  def choose_features
    @character = Character.find_by_id(params["character_id"])
    @character.update(character_params) if params && params["character"]

  end

  def choose_skills
    @character = Character.find_by_id(params["character_id"])
    @klass = @character.klass

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

  end

  def show
    @character = Character.find_by_id(params[:id])
  end

  def edit
    @users = User.all
    @character = Character.find_by_id(params[:id])
    @campaigns = Campaign.all
    @characters = @current_user.characters
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
      :level_1_strength,
      :level_4_strength,
      :level_8_strength,
      :level_11_strength,
      :level_14_strength,
      :level_18_strength,
      :level_21_strength,
      :level_24_strength,
      :level_28_strength,
      :level_1_constitution,
      :level_4_constitution,
      :level_8_constitution,
      :level_11_constitution,
      :level_14_constitution,
      :level_18_constitution,
      :level_21_constitution,
      :level_24_constitution,
      :level_28_constitution,
      :level_1_dexterity,
      :level_4_dexterity,
      :level_8_dexterity,
      :level_11_dexterity,
      :level_14_dexterity,
      :level_18_dexterity,
      :level_21_dexterity,
      :level_24_dexterity,
      :level_28_dexterity,
      :level_1_intelligence,
      :level_4_intelligence,
      :level_8_intelligence,
      :level_11_intelligence,
      :level_14_intelligence,
      :level_18_intelligence,
      :level_21_intelligence,
      :level_24_intelligence,
      :level_28_intelligence,
      :level_1_wisdom,
      :level_4_wisdom,
      :level_8_wisdom,
      :level_11_wisdom,
      :level_14_wisdom,
      :level_18_wisdom,
      :level_21_wisdom,
      :level_24_wisdom,
      :level_28_wisdom,
      :level_1_charisma,
      :level_4_charisma,
      :level_8_charisma,
      :level_11_charisma,
      :level_14_charisma,
      :level_18_charisma,
      :level_21_charisma,
      :level_24_charisma,
      :level_28_charisma,
      {game_ids:[]},
      {language_ids: []},
      {campaign_ids: []}
      )
  end

  def find_dependancies
    @characters = @current_user.characters.complete
    @gods = God.all.order(:name)
    @races = Race.all.order(:name)
    @klasses = Klass.select(:id, :name, :role).all.group_by(&:role)
    @languages = Language.all.order(:language)
  end

end
