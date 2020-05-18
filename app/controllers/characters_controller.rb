class CharactersController < ApplicationController
  include CharacterCreation
  include MagicItemModule

  layout 'no_sidebloc', only: %i[index new]
  before_action :find_dependancies, except: %i[index new create resume_race resume_klass]

  def index
    @characters = @current_user.characters.order(:name)
  end

  def new
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
      redirect_to choose_race_character_creation_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :new
    end
  end

  def show
    @characters = @current_user.characters.order(:name)
    redirect_to check_todo_character and return if @character.draft?
    skills_tab
    @show_languages = @character.show_languages
    @dexterity = @abilities.dexterity
    # @abilities = @character.ability_bonuses.select_ability_name.joins(:ability)
    @defenses = {
      CA: @abilities.reflexes,
      Vig: @abilities.fortitude,
      Ref: @abilities.reflexes,
      Vol: @abilities.will
    }
    @race_features = @character.race_choices.map(&:feature)
    @classe_features = @character.klass_choices.map(&:feature)
    @character_magic_items = @character.magic_items
    @chosen_feats = @character.chosen_feats
    @feats_languages = @character.chosen_feats.languages
    @hp = @character.hit_points
    @equipped_magic_items_partial_variables = []
    magic_stuff = @character.equipped_magic_items.joins(:source, :location).select('magic_items.*, equipment.level as level, sources.name as source_name, locations.name as location_name, locations.code as location_code')
    magic_stuff.each do |ms|
      @equipped_magic_items_partial_variables << search_show_relation(ms, true, ms.level)
    end
  end

  def edit
    @characters = @current_user.characters.order(:name)
    @users = User.all
    @campaigns = Campaign.all
    @common_weapons = CommonWeapon.all.order(:name)
    @common_armors = CommonArmor.armors.order(:name)
    @common_shields = CommonArmor.shields.order(:name)
    @second_hand_type_options = [
      ['Arme', 'CommonWeapon'],
      ['Bouclier', 'CommonArmor']
    ]
  end

  def update
    if @character.update(character_params)
      redirect_to character_path(@character)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_path
  end

  # Ajax request

  def choose_campaign
    player = Player.find_by(user_id: @current_user.id, character_id: params[:id], campaign_id: params[:camp])
    if player
      flash[:error] = 'Erreur, vous semblez avoir déjà rejoins la campagne'
    else
      player = Player.new(user_id: @current_user.id, character_id: params[:id], campaign_id: params[:camp])
    end

    if player.save
      flash[:success] = 'Vous avez rejoint la campagne'
      redirect_to edit_character_path(params[:id])
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{player.errors.full_messages}"
      render :edit
    end
  end

  def remove_campaign
    player = Player.find_by(user_id: @current_user.id, character_id: params[:id], campaign_id: params[:camp])

    if player&.delete
      flash[:success] = 'Vous avez quitter la campagne'
      redirect_to edit_character_path(params[:id])
    else
      find_dependancies
      flash[:error] = 'Erreur, vous semblez avoir déjà quitter la campagne'
      render :edit
    end
  end

  private

  def find_dependancies
    @character = Character.find_by_id(params['id'])
    @abilities = @character.ability_bonuses.select_ability_name.joins(:ability)
    @skills = @character.skill_bonuses.select_skill_name.joins(:skill).joins(:ability_bonus)
  end

  # Information to display in show character, skills tab
  def skills_tab
    skill_bonuses = @character.skill_bonuses.select_ability_total_bonus.select_skill_name.joins(:skill).joins(:ability_bonus)
    @insight = skill_bonuses.insight
    @perception = skill_bonuses.perception
    @skill_bonuses = skill_bonuses.sort_by(&:fr_name)
    @klass_choosable_skill_bonus = @character.klass.try(&:choosable_skills_to_a)
  end

  def check_todo_character
    return choose_race_character_creation_path(@character) if @character.race.nil?
    return choose_class_character_creation_path(@character) if @character.klass.nil?
    return choose_optional_fields_character_creation_path(@character) if @character.alignment.nil?
    return choose_abilities_character_creation_path(@character) if @character.ability_bonus_ids.empty? || @character.ability_bonuses.map(&:total_value).uniq.first.zero?
    return choose_features_character_creation_path(@character) if @character.feature_ids.empty?
    return choose_skills_character_creation_path(@character) if @character.skill_bonus_ids.empty? || @character.skill_bonuses.map(&:training).uniq == [0]
    return choose_feats_character_creation_path(@character) if @character.feat_ids.empty?
  end
end
