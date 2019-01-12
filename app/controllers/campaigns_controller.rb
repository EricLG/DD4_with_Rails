class CampaignsController < ApplicationController
  before_filter :find_dependancies, only: %i[index new edit show]

  def index; end

  def new
    @users = User.all
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaigns_path
    else
      render :new
    end
  end

  def destroy; end

  def show
    @campaign = Campaign.includes(:games).find_by_id(params[:id])
    @games = @campaign.games.order(played: :asc)
    @characters = @campaign.characters
    @comment = Comment.new
    campaign_comments = @campaign.comments.where(game_id: nil)
    @rp_comments = campaign_comments.rp
    @debrief_comments = campaign_comments.debrief
    @note_comments = campaign_comments.where(user: @current_user).note
  end

  def edit
    @users = User.all
    @campaign = Campaign.find_by_id(params[:id])
    @game_master_id = @campaign.game_master_id
  end

  def update
    @campaign = Campaign.find_by_id(params[:id])
    if @campaign.update(campaign_params)
      redirect_to campaigns_path
    else
      render :edit
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(
      :name,
      :description,
      :status,
      :game_master_id,
      comment_ids: []
    )
  end

  def find_dependancies
    @current_campaigns = Campaign.where(status: :in_progress).order(created_at: :desc)
    @finished_campaigns = Campaign.where(status: :finished).order(created_at: :desc)
  end
end
