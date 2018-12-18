class Admin::AdminController < ApplicationController
  before_filter :authorize_admin

  def index
    @hide_side_bloc = true
    render 'admin/index'
  end

  def import
    @hide_side_bloc = true
  end

  def export_items
    @items = MagicItem.includes(:source, :weapon_groups, :armor_categories, :location, :implement_group, :object_levels).order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @items.to_csv(encoding: 'UTF-8', col_sep: ';', headers: true) }
    end
  end

  def contribute
    @hide_side_bloc = true if @current_user
  end

  def items
    if MagicItem.count != 0
      flash[:error] = 'Il existe déjà des items magiques, import annulé.'
    else
      MagicItem.import_items
      flash[:success] = "L'import des items magiques à terminé (1146 objets en théorie)"
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

  def stats
    @stats = []
    @stats << { table_name: 'ArmorCategory',    table_count: ArmorCategory.count }
    @stats << { table_name: 'Campaign',         table_count: Campaign.count }
    @stats << { table_name: 'Character',        table_count: Character.count }
    @stats << { table_name: 'CommonArmor',      table_count: CommonArmor.count }
    @stats << { table_name: 'CommonWeapon',     table_count: CommonWeapon.count }
    @stats << { table_name: 'Consumable',       table_count: Consumable.count }
    @stats << { table_name: 'Feat',             table_count: Feat.count }
    @stats << { table_name: 'Feature',          table_count: Feature.count }
    @stats << { table_name: 'Game',             table_count: Game.count }
    @stats << { table_name: 'ImplementGroup',   table_count: ImplementGroup.count }
    @stats << { table_name: 'Klass',            table_count: Klass.count }
    @stats << { table_name: 'Location',         table_count: Location.count }
    @stats << { table_name: 'MagicItem',        table_count: MagicItem.count }
    @stats << { table_name: 'ObjectLevel',      table_count: ObjectLevel.count }
    @stats << { table_name: 'Race',             table_count: Race.count }
    @stats << { table_name: 'Source',           table_count: Source.count }
    @stats << { table_name: 'Stat',             table_count: Stat.count }
    @stats << { table_name: 'User',             table_count: User.count }
    @stats << { table_name: 'WeaponCategory',   table_count: WeaponCategory.count }
    @stats << { table_name: 'WeaponGroup',      table_count: WeaponGroup.count }
    @stats << { table_name: 'WeaponProperty',   table_count: WeaponProperty.count }
  end
end
