class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
    @users = User.all
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaigns_path
    else
      render new_campaign_path
    end
  end

  def destroy

  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
  end

  def edit
    @users = User.all
    @campaign = Campaign.find_by_id(params[:id])
  end

  def update
    @campaign = Campaign.find_by_id(params[:id])
    if @campaign.update(campaign_params)
      redirect_to campaigns_path
    else
      render new_campaign_path
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(
      :name,
      :description,
      :game_master_id
    )
  end

end
