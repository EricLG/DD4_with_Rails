class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
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

  end

  def update

  end

  private

  def campaign_params
    params.require(:campaign).permit(
      :name,
      :description
    )
  end

end
