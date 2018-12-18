class GamesController < ApplicationController
  def index; end

  def new
    @campaign = Campaign.find_by_id(params[:campaign_id])
    @game = Game.new(campaign: @campaign)
  end

  def create
    @campaign = Campaign.find_by_id(params[:campaign_id])
    @game = Game.new(game_params)
    if @game.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def destroy; end

  def show
    @campaign = Campaign.find_by_id(params[:campaign_id])
    @game = Game.find_by_id(params[:id])
  end

  def edit; end

  def update; end

  private

  def game_params
    params.require(:game).permit(
      :played,
      :description,
      :campaign_id
    )
  end
end
