class FeatsController < ApplicationController

  #before_filter :authorize
  before_action :find_dependancies, only: [:heroics, :parangonics, :epics, :new, :edit]

  def index
  end

  def heroics
    @search = FeatSearch.new(params[:feat_search], "heroic")
    @feats = @search.build_search.distinct.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
    render :sorted_feats
  end

  def parangonics
    @search = FeatSearch.new(params[:feat_search], "parangonic")
    @feats = @search.build_search.distinct.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
    render :sorted_feats
  end

  def epics
    @search = FeatSearch.new(params[:feat_search], "epic")
    @feats = @search.build_search.distinct.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
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
      render :new
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
      render :edit
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
    @sources = Source.feats
    @races = Race.all
    @klasses = Klass.all
    @features = Feature.all
  end
end
