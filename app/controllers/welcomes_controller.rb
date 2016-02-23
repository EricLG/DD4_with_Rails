class WelcomesController < ApplicationController

  before_filter :authorize_admin, except: [:index, :random]

  def random
    armes = MagicWeapon.all.sample(10)
    armures = MagicArmor.all.sample(10)
    gears = MagicGear.all.sample(10)
    focas = MagicImplement.all.sample(10)
    @randomObjects = [armes, armures, gears, focas].flatten.shuffle.first(10)
  end

  def index
    @hide_side_bloc = true if @current_user
  end

  def import
    @hide_side_bloc = true
  end

  def contribute
    @hide_side_bloc = true if @current_user
  end

  def items
    if MagicItem.count != 0
      flash[:error] = "Il existe déjà des items magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicItem.import_items
      flash[:success] = "L'import des items magiques à terminé (1147 objets en théorie)"
      redirect_to object_magic_items_path
    end
  end
  def weapons
    if MagicWeapon.count != 0
      flash[:error] = "Il existe déjà des armes magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicWeapon.import_weapons
      flash[:success] = "L'import des armes magiques à terminé (210 objets en théorie)"
      redirect_to object_magic_weapons_path
    end
  end

  def armors
    if MagicArmor.count != 0
      flash[:error] = "Il existe déjà des armures magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicArmor.import_armors
      flash[:success] = "L'import des armures magiques à terminé (230 objets en théorie)"
      redirect_to object_magic_armors_path
    end
  end

  def gears
    if MagicGear.count != 0
      flash[:error] = "Il existe déjà des équipements magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicGear.import_gears
      flash[:success] = "L'import des équipements magiques à terminé (559 objets en théorie)"
      redirect_to object_magic_gears_path
    end
  end

  def implements
    if MagicImplement.count != 0
      flash[:error] = "Il existe déjà des focaliseurs magiques, import annulé."
      redirect_to import_welcomes_path
    else
      MagicImplement.import_implements
      flash[:success] = "L'import des focaliseurs magiques à terminé (147 objets en théorie)"
      redirect_to object_magic_implements_path
    end
  end

  def feats
    if Feat.count != 0
      flash[:error] = "Il existe déjà des talents, import annulé."
      redirect_to import_welcomes_path
    else
      Feat.import_feats
      flash[:success] = "L'import des talents à terminé"
      redirect_to feats_path
    end
  end
end
