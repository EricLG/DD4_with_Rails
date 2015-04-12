class FeatsController < ApplicationController

  before_action :find_dependancies, only: [:new, :edit]

  def index
  end

  def heroics
    @feats = Feat.where(categorie: "heroic")
    render :sorted_feats
  end

  def parangonics
    @feats = Feat.where(categorie: "parangonic")
    render :sorted_feats
  end

  def epics
    @feats = Feat.where(categorie: "epic")
    render :sorted_feats
  end

  def new
    @feat = Feat.new
  end

  def create
    @feat = Feat.create(feat_params)
    if @feat.persisted?
      redirect_to feat_path(@feat.id)
    else
      render feat_path
    end
  end

  def destroy
    @feat = Feat.find_by_id(params[:id])
    @feat.destroy
    redirect_to feats_path
  end

  def show
    @feat = Feat.find_by_id(params[:id])
  end

  def edit
    @feat = Feat.find_by_id(params[:id])
  end

  def update
    @feat = Feat.find_by_id(params[:id])
    @feat.update!(feat_params)
    if @feat.persisted?
      redirect_to feat_path(@feat.id)
    else
      render feat_path
    end
  end


  private

  def feat_params
    params.require(:feat).permit(
      :name,
      :avantage,
      :source_id
    )
  end

  def find_dependancies
    @sources = Source.all
  end
end
