class KlassesController < ApplicationController
  layout 'no_sidebloc', only: :index

  def index
    @klasses = Klass.select(:id, :name, :role).all.order(:name).group_by(&:role)
  end

  def show
    @klasses = Klass.select(:id, :name).all.order(:name)
    @klass = Klass.includes(:features, :source).find_by_id(params[:id])
  end
end
