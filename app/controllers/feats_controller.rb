class FeatsController < ApplicationController

  before_action :find_dependancies, only: [:new, :edit]

  def index
  end

  def heroics
    @feats = Feat.where(category: "heroic").order(name: :asc).paginate(:page => params[:page], :per_page => 20)
    render :sorted_feats
  end

  def parangonics
    @feats = Feat.where(category: "parangonic").order(name: :asc).paginate(:page => params[:page], :per_page => 20)
    render :sorted_feats
  end

  def epics
    @feats = Feat.where(category: "epic").order(name: :asc).paginate(:page => params[:page], :per_page => 20)
    render :sorted_feats
  end

  def new
    @feat = Feat.new
  end

  def create
    @feat = Feat.new(feat_params)
    if @feat.save
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
      :category,
      :errata,
      :source_id,
      {race_ids:[]},
      {klass_ids:[]}
    )
  end

  def find_dependancies
    @sources = Source.all
    @races = Race.all
    @klasses = Klass.all
    @class_features = ClassFeature.all
  end
end
