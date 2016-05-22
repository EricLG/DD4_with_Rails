class CharactersController < ApplicationController

  before_filter :find_dependancies, only: [:index, :new, :edit, :show, :choose_race, :choose_carac, :choose_class, :choose_skill, :optional_fields]

  def index
    @hide_side_bloc =true
    @characters = Character.all
  end

  def new
    @hide_side_bloc = true
    @character = Character.new
  end

  def choose_race
    @hide_side_bloc =true
    @character = Character.find_by_id(params["character_id"])
  end

  def choose_class
    @hide_side_bloc =true
    @character = Character.find_by_id(params["character_id"])
    if params && params["character"]
      @character.race_id = params["character"]["race_id"]
      @character.save!
    end
  end

  def choose_carac
    @hide_side_bloc =true
    @character = Character.find_by_id(params["character_id"])
    if params && params["character"]
      @character.klass_id = params["character"]["klass_id"]
      @character.save!
    end
    @random_stats = [random_stat, random_stat, random_stat, random_stat, random_stat, random_stat].sort {|x,y| y <=> x }
    @random_stats
  end

  def choose_skills
    @hide_side_bloc =true
    @character = Character.find_by_id(params["character_id"])
    @klass = @character.klass
    if params && params["character"]
      @character.klass_id = params["character"]["klass_id"]
      @character.save!
    end
  end

  def choose_skill

  end

  def optional_fields

  end

  def create
    @character = Character.new(character_params)
    @character.status = 'draft'
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
      {game_ids:[]}
      )
  end

  def find_dependancies
    @characters = @current_user.characters.complete
    @races = Race.all
    @klasses = Klass.select(:id, :name, :role).all.group_by(&:role)
  end

end
