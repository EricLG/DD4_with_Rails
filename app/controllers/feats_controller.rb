class FeatsController < ApplicationController
  before_action :find_dependancies, only: %i[index new edit]

  def index
    @search = FeatSearch.new(search_feat_params)
    @categories = [
      %w[Héroique heroic],
      %w[Parangonique parangonic],
      %w[Épique epic]
    ]
    @feats = @search.build_search.distinct.paginate(page: params[:page], per_page: 20).order(name: :asc)
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

  def feat_avantage
    feat = Feat.select(:id, :name, :avantage, :prerequisites, :category).find(params[:id])
    feat.prerequisites = feat.prerequisites.blank? ? 'Aucun prérequis' : feat.prerequisites
    feat.category = Feat.human_attribute_name("category.#{feat.category}")
    respond_to do |format|
      format.js { render json: feat }
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
      race_ids: [],
      klass_ids: []
    )
  end

  def search_feat_params
    return unless params && params[:feat_search]

    params.require(:feat_search).permit(
      :name,
      :category,
      :prerequisited_klasses,
      :prerequisited_races,
      :source
    )
  end

  def find_dependancies
    @sources = Source.feats
    @races = Race.all
    @klasses = Klass.all
    @features = Feature.all
  end
end
