class KlassesController < ApplicationController

  def index
    @klasses = Klass.select(:id, :name).all
  end

  def show
    @klass = Klass.includes(:class_features, :source).find_by_id(params[:id])
  end

end
