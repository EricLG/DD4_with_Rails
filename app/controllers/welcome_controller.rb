#require 'import_data'

class WelcomeController < ApplicationController

 #include ImportData

  def index

  end

  def import
    #MagicWeapon.import_weapons
    #MagicArmor.import_armors
    #MagicImplement.import_implements
    #MagicGear.import_gears
    #Feat.import_feats
    redirect_to :root
  end

end
