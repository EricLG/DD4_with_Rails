class MagicImplementsController < ApplicationController

  before_action :find_dependancies, only: [:index, :new, :edit]

  def index
    @search = MagicSearch.new(params[:magic_search], MagicImplement)
    @implements = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
  end

  def new
    @implement = MagicImplement.new
  end

  def create
    @implement = MagicImplement.create(magic_implement_params)
    if @implement.persisted?
      redirect_to object_magic_implement_path(@implement.id)
    else
      render object_magic_implements_path
    end
  end

  def destroy
    @implement = MagicImplement.find_by_id(params[:id])
    @implement.destroy
    redirect_to object_magic_implements_path
  end

  def show
    @implement = MagicImplement.find_by_id(params[:id])
  end

  def edit
    @implement = MagicImplement.find_by_id(params[:id])
  end

  def update
    @implement = MagicImplement.find_by_id(params[:id])
    @implement.update!(magic_implement_params)
    if @implement.persisted?
      redirect_to object_magic_implement_path(@implement.id)
    else
      render object_magic_implements_path
    end
  end


  private

  def magic_implement_params
    params.require(:magic_implement).permit(
      :name,
      :description,
      :alteration,
      :critical,
      :property,
      :power,
      :special,
      :source_id,
      {implement_group_ids:[]},
      {object_level_ids:[]}
    )
  end

  def find_dependancies
    @implement_groups = ImplementGroup.all
    @levels = ObjectLevel.all
    @sources = Source.all
  end
end
