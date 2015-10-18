class CharactersController < ApplicationController

  before_filter :find_dependancies, only: [:index, :new, :edit, :show]

  def index
    @hide_side_bloc =true
  end

  def new
    @character = Character.new
    @characters = @current_user.characters
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to characters_path
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render new_character_path
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
      render new_character_path
    end
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
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
      {game_ids:[]}
    )
  end

  def find_dependancies
    @characters = @current_user.characters
    @races = Race.all
    @klasses = Klass.all
  end

end
