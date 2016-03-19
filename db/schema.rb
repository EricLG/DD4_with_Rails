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

ActiveRecord::Schema.define(version: 20151018130000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armor_categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "heavy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "armor_categories", ["code"], name: "index_armor_categories_on_code", using: :btree

  create_table "armor_categories_magic_items", id: false, force: :cascade do |t|
    t.integer "magic_item_id"
    t.integer "armor_category_id"
  end

  add_index "armor_categories_magic_items", ["armor_category_id"], name: "index_armor_categories_magic_items_on_armor_category_id", using: :btree
  add_index "armor_categories_magic_items", ["magic_item_id"], name: "index_armor_categories_magic_items_on_magic_item_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "game_master_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "experience"
    t.integer  "level"
    t.string   "parangon"
    t.string   "epic"
    t.integer  "age"
    t.string   "height"
    t.string   "weight"
    t.string   "alignment"
    t.string   "divinity"
    t.string   "party"
    t.integer  "status"
    t.integer  "initial_stat_id"
    t.integer  "level_4_id"
    t.integer  "level_8_id"
    t.integer  "level_11_id"
    t.integer  "level_14_id"
    t.integer  "level_18_id"
    t.integer  "level_21_id"
    t.integer  "level_24_id"
    t.integer  "level_28_id"
    t.integer  "race_stat_id"
    t.integer  "user_id"
    t.integer  "klass_id"
    t.integer  "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters_games", id: false, force: :cascade do |t|
    t.integer "character_id"
    t.integer "game_id"
  end

  add_index "characters_games", ["character_id"], name: "index_characters_games_on_character_id", using: :btree
  add_index "characters_games", ["game_id"], name: "index_characters_games_on_game_id", using: :btree

  create_table "common_armors", force: :cascade do |t|
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

  create_table "common_weapons", force: :cascade do |t|
    t.string   "name"
    t.string   "weight"
    t.string   "price"
    t.string   "damage"
    t.string   "handling"
    t.string   "range"
    t.string   "two_handed"
    t.integer  "source_id"
    t.integer  "weapon_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "common_weapons", ["source_id"], name: "index_common_weapons_on_source_id", using: :btree
  add_index "common_weapons", ["weapon_category_id"], name: "index_common_weapons_on_weapon_category_id", using: :btree

  create_table "common_weapons_weapon_groups", id: false, force: :cascade do |t|
    t.integer "common_weapon_id"
    t.integer "weapon_group_id"
  end

  add_index "common_weapons_weapon_groups", ["common_weapon_id"], name: "index_common_weapons_weapon_groups_on_common_weapon_id", using: :btree
  add_index "common_weapons_weapon_groups", ["weapon_group_id"], name: "index_common_weapons_weapon_groups_on_weapon_group_id", using: :btree

  create_table "common_weapons_weapon_properties", id: false, force: :cascade do |t|
    t.integer "common_weapon_id"
    t.integer "weapon_property_id"
  end

  add_index "common_weapons_weapon_properties", ["common_weapon_id"], name: "index_common_weapons_weapon_properties_on_common_weapon_id", using: :btree
  add_index "common_weapons_weapon_properties", ["weapon_property_id"], name: "index_common_weapons_weapon_properties_on_weapon_property_id", using: :btree

  create_table "consumables", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "kind"
    t.string   "alteration"
    t.string   "property"
    t.string   "power"
    t.string   "special"
    t.integer  "source_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "consumables_object_levels", id: false, force: :cascade do |t|
    t.integer "consumable_id"
    t.integer "object_level_id"
  end

  add_index "consumables_object_levels", ["consumable_id"], name: "index_consumables_object_levels_on_consumable_id", using: :btree
  add_index "consumables_object_levels", ["object_level_id"], name: "index_consumables_object_levels_on_object_level_id", using: :btree

  create_table "feats", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.text     "avantage"
    t.string   "errata"
    t.string   "prerequisited_power"
    t.string   "prerequisited_skill"
    t.string   "prerequisited_other"
    t.integer  "top_feat_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feats", ["source_id"], name: "index_feats_on_source_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.datetime "played"
    t.text     "description"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "implement_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "implement_groups", ["code"], name: "index_implement_groups_on_code", using: :btree

  create_table "klass_features", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "top_feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klass_features", ["top_feature_id"], name: "index_klass_features_on_top_feature_id", using: :btree

  create_table "klass_features_klasses", id: false, force: :cascade do |t|
    t.integer "klass_feature_id"
    t.integer "klass_id"
  end

  add_index "klass_features_klasses", ["klass_feature_id"], name: "index_klass_features_klasses_on_klass_feature_id", using: :btree
  add_index "klass_features_klasses", ["klass_id"], name: "index_klass_features_klasses_on_klass_id", using: :btree

  create_table "klasses", force: :cascade do |t|
    t.string   "name"
    t.string   "power_source"
    t.text     "information"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klasses", ["source_id"], name: "index_klasses_on_source_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["code"], name: "index_locations_on_code", using: :btree

  create_table "magic_items", force: :cascade do |t|
    t.string   "name"
    t.string   "description",        limit: 500
    t.string   "alteration",         limit: 500
    t.text     "property"
    t.text     "power"
    t.text     "special"
    t.integer  "source_id"
    t.integer  "rarity"
    t.string   "critical",           limit: 500
    t.integer  "implement_group_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_items", ["name"], name: "index_magic_items_on_name", using: :btree
  add_index "magic_items", ["source_id"], name: "index_magic_items_on_source_id", using: :btree

  create_table "magic_items_object_levels", id: false, force: :cascade do |t|
    t.integer "magic_item_id"
    t.integer "object_level_id"
  end

  add_index "magic_items_object_levels", ["magic_item_id"], name: "index_magic_items_object_levels_on_magic_item_id", using: :btree
  add_index "magic_items_object_levels", ["object_level_id"], name: "index_magic_items_object_levels_on_object_level_id", using: :btree

  create_table "magic_items_weapon_groups", id: false, force: :cascade do |t|
    t.integer "magic_item_id"
    t.integer "weapon_group_id"
  end

  add_index "magic_items_weapon_groups", ["magic_item_id"], name: "index_magic_items_weapon_groups_on_magic_item_id", using: :btree
  add_index "magic_items_weapon_groups", ["weapon_group_id"], name: "index_magic_items_weapon_groups_on_weapon_group_id", using: :btree

  create_table "object_levels", force: :cascade do |t|
    t.integer  "level"
    t.string   "price"
    t.integer  "alteration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cons_price"
  end

  add_index "object_levels", ["level"], name: "index_object_levels_on_level", using: :btree

  create_table "pr_klass_features_for_feat", id: false, force: :cascade do |t|
    t.integer "feat_id"
    t.integer "klass_feature_id"
  end

  add_index "pr_klass_features_for_feat", ["feat_id"], name: "index_pr_klass_features_for_feat_on_feat_id", using: :btree
  add_index "pr_klass_features_for_feat", ["klass_feature_id"], name: "index_pr_klass_features_for_feat_on_klass_feature_id", using: :btree

  create_table "pr_klasses_for_feat", id: false, force: :cascade do |t|
    t.integer "feat_id"
    t.integer "klass_id"
  end

  add_index "pr_klasses_for_feat", ["feat_id"], name: "index_pr_klasses_for_feat_on_feat_id", using: :btree
  add_index "pr_klasses_for_feat", ["klass_id"], name: "index_pr_klasses_for_feat_on_klass_id", using: :btree

  create_table "pr_race_features_for_feat", id: false, force: :cascade do |t|
    t.integer "feat_id"
    t.integer "race_feature_id"
  end

  add_index "pr_race_features_for_feat", ["feat_id"], name: "index_pr_race_features_for_feat_on_feat_id", using: :btree
  add_index "pr_race_features_for_feat", ["race_feature_id"], name: "index_pr_race_features_for_feat_on_race_feature_id", using: :btree

  create_table "pr_races_for_feat", id: false, force: :cascade do |t|
    t.integer "feat_id"
    t.integer "race_id"
  end

  add_index "pr_races_for_feat", ["feat_id"], name: "index_pr_races_for_feat_on_feat_id", using: :btree
  add_index "pr_races_for_feat", ["race_id"], name: "index_pr_races_for_feat_on_race_id", using: :btree

  create_table "race_features", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "race_features_races", id: false, force: :cascade do |t|
    t.integer "race_feature_id"
    t.integer "race_id"
  end

  add_index "race_features_races", ["race_feature_id"], name: "index_race_features_races_on_race_feature_id", using: :btree
  add_index "race_features_races", ["race_id"], name: "index_race_features_races_on_race_id", using: :btree

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "average_height"
    t.string   "average_weight"
    t.string   "cat_size"
    t.integer  "speed"
    t.string   "vision"
    t.string   "language"
    t.text     "information"
    t.integer  "skill_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "races", ["source_id"], name: "index_races_on_source_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "acrobatics",    default: 0
    t.integer  "arcana",        default: 0
    t.integer  "athletics",     default: 0
    t.integer  "bluff",         default: 0
    t.integer  "diplomacy",     default: 0
    t.integer  "dungeoneering", default: 0
    t.integer  "endurance",     default: 0
    t.integer  "heal",          default: 0
    t.integer  "history",       default: 0
    t.integer  "insight",       default: 0
    t.integer  "intimidate",    default: 0
    t.integer  "nature",        default: 0
    t.integer  "perception",    default: 0
    t.integer  "religion",      default: 0
    t.integer  "stealth",       default: 0
    t.integer  "streetwise",    default: 0
    t.integer  "thievery",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: :cascade do |t|
    t.integer  "strength"
    t.integer  "constitution"
    t.integer  "dexterity"
    t.integer  "intelligence"
    t.integer  "wisdom"
    t.integer  "charisma"
    t.string   "kind"
    t.integer  "race_id"
    t.integer  "pr_for_feat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["pr_for_feat_id"], name: "index_stats_on_pr_for_feat_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "weapon_categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "ranged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weapon_categories", ["code"], name: "index_weapon_categories_on_code", using: :btree

  create_table "weapon_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapon_properties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
