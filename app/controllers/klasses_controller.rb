class KlassesController < ApplicationController
  def index
    @hide_side_bloc = true
    @klasses = Klass.select(:id, :name, :role).all.group_by(&:role)
  end

  def show
    @klasses = Klass.select(:id, :name).all
    @klass = Klass.includes(:features, :source).find_by_id(params[:id])
  end
end
