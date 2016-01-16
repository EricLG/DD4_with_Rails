class SearchController < ApplicationController

  def index
    @hide_side_bloc = true
    @request = params[:search]
    @result = {}
    @result[:magic_weapon], @result[:magic_armor], @result[:magic_implement], @result[:magic_gear], @total = [], [], [], [], 0
    unless @request.blank?
      @result[:magic_weapon ]     = MagicWeapon.where('name ILIKE ? or property ILIKE ? or power ILIKE ?', "%#{@request}%", "%#{@request}%", "%#{@request}%")
      @result[:magic_armor ]      = MagicArmor.where('name ILIKE ? or property ILIKE ? or power ILIKE ?', "%#{@request}%", "%#{@request}%", "%#{@request}%")
      @result[:magic_implement ]  = MagicImplement.where('name ILIKE ? or property ILIKE ? or power ILIKE ?', "%#{@request}%", "%#{@request}%", "%#{@request}%")
      @result[:magic_gear ]       = MagicGear.where('name ILIKE ? or property ILIKE ? or power ILIKE ?', "%#{@request}%", "%#{@request}%", "%#{@request}%")
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
