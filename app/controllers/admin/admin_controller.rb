class Admin::AdminController < ApplicationController
  layout 'no_sidebloc'
  before_action :authorize_admin

  def index
    render 'admin/index'
  end

  def export_items
    @items = MagicItem.includes(:source, :weapon_groups, :armor_categories, :location, :implement_group, :object_levels).order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @items.to_csv(encoding: 'UTF-8', col_sep: ';', headers: true) }
    end
  end

  def items
    if MagicItem.count != 0
      flash[:error] = 'Il existe déjà des items magiques, import annulé.'
    else
      MagicItem.import_items
      flash[:success] = "L'import des items magiques à terminé (#{MagicItem.count}/1146)"
    end
    redirect_to admin_index_path
  end

  def feats
    if Feat.count != 0
      flash[:error] = 'Il existe déjà des talents, import annulé.'
      redirect_to import_welcomes_path
    else
      Feat.import_feats
      flash[:success] = "L'import des talents à terminé"
      redirect_to feats_path
    end
  end

  def monsters
    if Monster.count != 0
      flash[:error] = 'Il existe déjà des monstres, import annulé.'
      redirect_to import_welcomes_path
    else
      Monster.import_monsters
      m = Monster.count
      flash[:success] = "L'import des monstres à terminé (#{m}/1331 en théorie)."
      redirect_to dm_tools_monsters_path
    end
  end

  def encounters
    if Encounter.count != 0
      flash[:error] = 'Il existe déjà des rencontres, import annulé.'
      redirect_to import_welcomes_path
    else
      Encounter.import_encounters
      e = Encounter.count
      flash[:success] = "L'import des rencontres à terminé (#{e}/652 rencontres)."
      redirect_to dm_tools_encounters_path
    end
  end
end
