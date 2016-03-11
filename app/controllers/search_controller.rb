class SearchController < ApplicationController

  def index
    @hide_side_bloc = true
    @request = params[:search]
    @result = {}
    @result[:magic_weapon], @result[:magic_armor], @result[:magic_implement], @result[:magic_gear], @total = [], [], [], [], 0
    results = MagicItem.where('magic_items.name ILIKE ? or property ILIKE ? or power ILIKE ?', "%#{@request}%", "%#{@request}%", "%#{@request}%")
    unless @request.blank?
      @result[:magic_weapon ]     = results.weapons
      @result[:magic_armor ]      = results.armors
      @result[:magic_implement ]  = results.implements
      @result[:magic_gear ]       = results.gears
      @total = count_result(@result)
      flash.now[:error] = "Aucun résultats" if @total == 0
    end
  end

  private

  def count_result(hash)
    total = 0
    t = hash.each do |k, v|

      total += v.count

    end
    return total
  end
end
