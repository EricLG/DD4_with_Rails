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
    @current_campaigns = Campaign.where(status: :in_progress).order(created_at: :desc)
    @finished_campaigns = Campaign.where(status: :finished).order(created_at: :desc)
    @campaign = Campaign.find_by_id(params[:campaign_id])
    @games = @campaign.games.order(played: :asc)
    @game = Game.find_by_id(params[:id])
    if params[:edit].nil?
      @comment = Comment.new(user: @current_user, game: @game)
    else
      @comment = Comment.where(id: params[:edit]).first
    end
  end

  def edit
    @campaign = Campaign.find_by_id(params[:campaign_id])
    @game = Game.find_by_id(params[:id])
  end

  def update
    @campaign = Campaign.find_by_id(params[:campaign_id])
    @game = Game.find_by_id(params[:id])
    @game.update!(game_params)
    if @game.persisted?
      redirect_to campaign_game_path(@campaign, @game)
    else
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(
      :played,
      :name,
      :description,
      :campaign_id,
      comment_ids: []
    )
  end
end
