class CharactersController < ApplicationController
  include CharactersServices
  include CharacterCreation
  include MagicItemModule

  layout 'no_sidebloc', only: %i[index new]
  before_action :find_dependancies, only: %i[show edit update destroy]

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
    show_character
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
    @character = Character.show(params['id'])
    @abilities = @character.ability_bonuses.select_ability_name.joins(:ability)
    @skills = @character.skill_bonuses.select_skill_name.joins(:skill).joins(:ability_bonus)
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
