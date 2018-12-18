class SearchController < ApplicationController
  def index
    @hide_side_bloc = true
    @request = params[:search]
    @result = {}
    %i[magic_weapon magic_armor magic_implement magic_gear magic_gear magic_amulet].each do |item|
      @result[item] = []
    end
    @total = 0
    results = MagicItem.where('magic_items.name ILIKE ? or property ILIKE ? or power ILIKE ?', "%#{@request}%", "%#{@request}%", "%#{@request}%")
    f_results = Feat.where('name ILIKE ? or avantage ILIKE ?', "%#{@request}%", "%#{@request}%")
    return if @request.blank?

    @result[:magic_weapon]     = results.weapons
    @result[:magic_armor]      = results.armors
    @result[:magic_implement]  = results.implements
    @result[:magic_gear]       = results.gears
    @result[:magic_amulet]     = results.amulets
    @result[:feat]             = f_results
    @total = count_result(@result)
    flash.now[:error] = 'Aucun résultats' if @total.zero?
  end

  private

  def count_result(hash)
    total = 0
    hash.each do |_k, v|
      total += v.count
    end
    total
  end
end
