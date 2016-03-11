class WelcomesController < ApplicationController

  before_filter :authorize_admin, except: [:index, :random]

  def random
    @hide_side_bloc = true
    @randomObjects = MagicItem.all.sample(10)
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
      flash[:success] = "L'import des items magiques à terminé (1146 objets en théorie)"
      redirect_to object_magic_items_path
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
