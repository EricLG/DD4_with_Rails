class CommonWeaponsController < ApplicationController

  def index
    @communs = CommonWeapon.all
  end

  def new
    @new_weapon = CommonWeapon.new
  end

  def add
  end

  def create
  end

  def delete
  end

  def show
  end

  def update
  end
end
