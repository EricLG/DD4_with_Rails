class WelcomesController < ApplicationController

  before_filter :authorize, except: [:index]
  def index

  end

  def import
  end

  def weapons
    if MagicWeapon.count != 0
      flash[:error] = "Il existe déjà des armes magiques, import annulé."
      redirect_to import_welcomes_path
    else
      #MagicWeapon.import_weapons
      flash[:notice] = "L'import des armes magiques à terminé"
      redirect_to object_magic_weapons_path
    end
  end

  def armors
    if MagicArmor.count != 0
      flash[:error] = "Il existe déjà des armures magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicArmor.import_armors
      flash[:notice] = "L'import des armures magiques à terminé"
      redirect_to object_magic_armors_path
    end
  end

  def gears
    if MagicGear.count != 0
      flash[:error] = "Il existe déjà des équipements magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicGear.import_gears
      flash[:notice] = "L'import des équipements magiques à terminé"
      redirect_to object_magic_gears_path
    end
  end

  def implements
    if MagicImplement.count != 0
      flash[:error] = "Il existe déjà des focaliseurs magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicImplement.import_implements
      flash[:notice] = "L'import des focaliseurs magiques à terminé"
      redirect_to object_magic_implements_path
    end
  end

  def feats
    if Feat.count != 0
      flash[:error] = "Il existe déjà des talents, import annulé."
      redirect_to import_welcomes_path
    else
      Feat.import_feats
      flash[:notice] = "L'import des talents à terminé"
      redirect_to feats_path
    end
  end
end
