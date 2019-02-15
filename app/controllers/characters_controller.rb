class CharactersController < ApplicationController
  include CharacterCreation
  layout 'no_sidebloc', only: %i[index new]
  before_filter :find_dependancies, except: %i[index new create resume_race resume_klass]

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
      redirect_to choose_race_character_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :new
    end
  end

  def show
    @characters = @current_user.characters
    @skill_bonuses = @character.skill_bonuses.joins(:skill).sort_by(&:fr_name)
    @klass_choosable_skill_bonus = @character.klass.choosable_skills_to_a
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

  def destroy
    @character.destroy
    redirect_to characters_path
  end

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

    if player && player.delete
      flash[:success] = 'Vous avez quitter la campagne'
      redirect_to edit_character_path(params[:id])
    else
      find_dependancies
      flash[:error] = 'Erreur, vous semblez avoir déjà quitter la campagne'
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
      :avatar,
      :racial_stat_id,
      :racial_bonus_choice,
      skill_choices: [
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
      ],
      game_ids: [],
      language_ids: [],
      campaign_ids: [],
      ability_bonuses_attributes: [
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
      skill_bonuses_attributes: [
        :id,
        :racial,
        :training
      ]
    )
  end

  def find_dependancies
    @character = Character.find_by_id(params['id'])
    @abilities = @character.ability_bonuses.joins(:ability)
    @skills = @character.skill_bonuses.joins(:skill)
  end
end
