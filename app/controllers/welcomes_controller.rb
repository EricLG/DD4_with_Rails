class WelcomesController < ApplicationController

  before_filter :authorize_admin, except: [:index, :random, :stats]

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

  def stats

    #models =[ArmorCategory, CommonArmor, CommonWeapon, ImplementGroup, Klass, KlassFeature, Location, ObjectLevel, Race, RaceFeature, Source, Stat, User, WeaponCategory, WeaponGroup, WeaponProperty]
    #models.each do |m|
    #  m.destroy_all
    #end

    @stats = []
    @stats << {table_name: "ArmorCategory",    table_count: ArmorCategory.count}
    @stats << {table_name: "Campaign",         table_count: Campaign.count}
    @stats << {table_name: "Character",        table_count: Character.count}
    @stats << {table_name: "CommonArmor",      table_count: CommonArmor.count}
    @stats << {table_name: "CommonWeapon",     table_count: CommonWeapon.count}
    @stats << {table_name: "Consumable",       table_count: Consumable.count}
    @stats << {table_name: "Feat",             table_count: Feat.count}
    @stats << {table_name: "Game",             table_count: Game.count}
    @stats << {table_name: "ImplementGroup",   table_count: ImplementGroup.count}
    @stats << {table_name: "Klass",            table_count: Klass.count}
    @stats << {table_name: "KlassFeature",     table_count: KlassFeature.count}
    @stats << {table_name: "Location",         table_count: Location.count}
    @stats << {table_name: "MagicItem",        table_count: MagicItem.count}
    @stats << {table_name: "ObjectLevel",      table_count: ObjectLevel.count}
    @stats << {table_name: "Race",             table_count: Race.count}
    @stats << {table_name: "RaceFeature",      table_count: RaceFeature.count}
    @stats << {table_name: "Source",           table_count: Source.count}
    @stats << {table_name: "Stat",             table_count: Stat.count}
    @stats << {table_name: "User",             table_count: User.count}
    @stats << {table_name: "WeaponCategory",   table_count: WeaponCategory.count}
    @stats << {table_name: "WeaponGroup",      table_count: WeaponGroup.count}
    @stats << {table_name: "WeaponProperty",   table_count: WeaponProperty.count}
  end
end
