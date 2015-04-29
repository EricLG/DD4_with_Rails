# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150318190125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armor_categories", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "heavy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "armor_categories_magic_armors", id: false, force: true do |t|
    t.integer "magic_armor_id"
    t.integer "armor_category_id"
  end

  add_index "armor_categories_magic_armors", ["armor_category_id"], name: "index_armor_categories_magic_armors_on_armor_category_id", using: :btree
  add_index "armor_categories_magic_armors", ["magic_armor_id"], name: "index_armor_categories_magic_armors_on_magic_armor_id", using: :btree

  create_table "armor_categories_magic_gears", id: false, force: true do |t|
    t.integer "magic_gear_id"
    t.integer "armor_category_id"
  end

  add_index "armor_categories_magic_gears", ["armor_category_id"], name: "index_armor_categories_magic_gears_on_armor_category_id", using: :btree
  add_index "armor_categories_magic_gears", ["magic_gear_id"], name: "index_armor_categories_magic_gears_on_magic_gear_id", using: :btree

  create_table "class_features", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_features_klasses", id: false, force: true do |t|
    t.integer "class_feature_id"
    t.integer "klass_id"
  end

  add_index "class_features_klasses", ["class_feature_id"], name: "index_class_features_klasses_on_class_feature_id", using: :btree
  add_index "class_features_klasses", ["klass_id"], name: "index_class_features_klasses_on_klass_id", using: :btree

  create_table "common_armors", force: true do |t|
    t.string   "name"
    t.string   "weight"
    t.string   "price"
    t.string   "armor_bonus"
    t.string   "min_alteration_bonus"
    t.string   "skill_malus"
    t.string   "ms_malus"
    t.string   "special"
    t.integer  "source_id"
    t.integer  "armor_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "common_armors", ["armor_category_id"], name: "index_common_armors_on_armor_category_id", using: :btree
  add_index "common_armors", ["source_id"], name: "index_common_armors_on_source_id", using: :btree

  create_table "common_weapons", force: true do |t|
    t.string   "name"
    t.string   "weight"
    t.string   "price"
    t.string   "damage"
    t.string   "handling"
    t.string   "range"
    t.boolean  "two_handed"
    t.integer  "source_id"
    t.integer  "weapon_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "common_weapons", ["source_id"], name: "index_common_weapons_on_source_id", using: :btree
  add_index "common_weapons", ["weapon_category_id"], name: "index_common_weapons_on_weapon_category_id", using: :btree

  create_table "common_weapons_weapon_groups", id: false, force: true do |t|
    t.integer "common_weapon_id"
    t.integer "weapon_group_id"
  end

  add_index "common_weapons_weapon_groups", ["common_weapon_id"], name: "index_common_weapons_weapon_groups_on_common_weapon_id", using: :btree
  add_index "common_weapons_weapon_groups", ["weapon_group_id"], name: "index_common_weapons_weapon_groups_on_weapon_group_id", using: :btree

  create_table "common_weapons_weapon_properties", id: false, force: true do |t|
    t.integer "common_weapon_id"
    t.integer "weapon_property_id"
  end

  add_index "common_weapons_weapon_properties", ["common_weapon_id"], name: "index_common_weapons_weapon_properties_on_common_weapon_id", using: :btree
  add_index "common_weapons_weapon_properties", ["weapon_property_id"], name: "index_common_weapons_weapon_properties_on_weapon_property_id", using: :btree

  create_table "feats", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "stat"
    t.text     "avantage"
    t.string   "errata"
    t.integer  "stat_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feats", ["source_id"], name: "index_feats_on_source_id", using: :btree
  add_index "feats", ["stat_id"], name: "index_feats_on_stat_id", using: :btree

  create_table "implement_groups", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "implement_groups_magic_implements", id: false, force: true do |t|
    t.integer "implement_group_id"
    t.integer "magic_implement_id"
  end

  add_index "implement_groups_magic_implements", ["implement_group_id"], name: "index_implement_groups_magic_implements_on_implement_group_id", using: :btree
  add_index "implement_groups_magic_implements", ["magic_implement_id"], name: "index_implement_groups_magic_implements_on_magic_implement_id", using: :btree

  create_table "klasses", force: true do |t|
    t.string   "name"
    t.string   "power_source"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klasses", ["source_id"], name: "index_klasses_on_source_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_armors", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 500
    t.string   "alteration",  limit: 500
    t.text     "property"
    t.text     "power"
    t.text     "special"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_armors", ["source_id"], name: "index_magic_armors_on_source_id", using: :btree

  create_table "magic_armors_object_levels", id: false, force: true do |t|
    t.integer "magic_armor_id"
    t.integer "object_level_id"
  end

  add_index "magic_armors_object_levels", ["magic_armor_id"], name: "index_magic_armors_object_levels_on_magic_armor_id", using: :btree
  add_index "magic_armors_object_levels", ["object_level_id"], name: "index_magic_armors_object_levels_on_object_level_id", using: :btree

  create_table "magic_gears", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 500
    t.string   "alteration",  limit: 500
    t.text     "property"
    t.text     "power"
    t.text     "special"
    t.integer  "location_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_gears", ["source_id"], name: "index_magic_gears_on_source_id", using: :btree

  create_table "magic_gears_object_levels", id: false, force: true do |t|
    t.integer "magic_gear_id"
    t.integer "object_level_id"
  end

  add_index "magic_gears_object_levels", ["magic_gear_id"], name: "index_magic_gears_object_levels_on_magic_gear_id", using: :btree
  add_index "magic_gears_object_levels", ["object_level_id"], name: "index_magic_gears_object_levels_on_object_level_id", using: :btree

  create_table "magic_implements", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 500
    t.string   "alteration",  limit: 500
    t.text     "property"
    t.string   "critical"
    t.text     "power"
    t.text     "special"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_implements_object_levels", id: false, force: true do |t|
    t.integer "magic_implement_id"
    t.integer "object_level_id"
  end

  add_index "magic_implements_object_levels", ["magic_implement_id"], name: "index_magic_implements_object_levels_on_magic_implement_id", using: :btree
  add_index "magic_implements_object_levels", ["object_level_id"], name: "index_magic_implements_object_levels_on_object_level_id", using: :btree

  create_table "magic_weapons", force: true do |t|
    t.string   "name"
    t.string   "description", limit: 500
    t.string   "alteration",  limit: 500
    t.string   "critical",    limit: 500
    t.text     "property"
    t.text     "power"
    t.text     "special"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_weapons", ["source_id"], name: "index_magic_weapons_on_source_id", using: :btree

  create_table "magic_weapons_object_levels", id: false, force: true do |t|
    t.integer "magic_weapon_id"
    t.integer "object_level_id"
  end

  add_index "magic_weapons_object_levels", ["magic_weapon_id"], name: "index_magic_weapons_object_levels_on_magic_weapon_id", using: :btree
  add_index "magic_weapons_object_levels", ["object_level_id"], name: "index_magic_weapons_object_levels_on_object_level_id", using: :btree

  create_table "magic_weapons_weapon_groups", id: false, force: true do |t|
    t.integer "magic_weapon_id"
    t.integer "weapon_group_id"
  end

  add_index "magic_weapons_weapon_groups", ["magic_weapon_id"], name: "index_magic_weapons_weapon_groups_on_magic_weapon_id", using: :btree
  add_index "magic_weapons_weapon_groups", ["weapon_group_id"], name: "index_magic_weapons_weapon_groups_on_weapon_group_id", using: :btree

  create_table "object_levels", force: true do |t|
    t.integer  "level"
    t.string   "price"
    t.integer  "alteration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pr_class_features_for_feat", id: false, force: true do |t|
    t.integer "feat_id"
    t.integer "class_feature_id"
  end

  add_index "pr_class_features_for_feat", ["class_feature_id"], name: "index_pr_class_features_for_feat_on_class_feature_id", using: :btree
  add_index "pr_class_features_for_feat", ["feat_id"], name: "index_pr_class_features_for_feat_on_feat_id", using: :btree

  create_table "pr_klasses_for_feat", id: false, force: true do |t|
    t.integer "feat_id"
    t.integer "klass_id"
  end

  add_index "pr_klasses_for_feat", ["feat_id"], name: "index_pr_klasses_for_feat_on_feat_id", using: :btree
  add_index "pr_klasses_for_feat", ["klass_id"], name: "index_pr_klasses_for_feat_on_klass_id", using: :btree

  create_table "pr_races_for_feat", id: false, force: true do |t|
    t.integer "feat_id"
    t.integer "race_id"
  end

  add_index "pr_races_for_feat", ["feat_id"], name: "index_pr_races_for_feat_on_feat_id", using: :btree
  add_index "pr_races_for_feat", ["race_id"], name: "index_pr_races_for_feat_on_race_id", using: :btree

  create_table "races", force: true do |t|
    t.string   "name"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "races", ["source_id"], name: "index_races_on_source_id", using: :btree

  create_table "sources", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: true do |t|
    t.integer  "strength"
    t.integer  "constitution"
    t.integer  "dexterity"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapon_categories", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "ranged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapon_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapon_properties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
