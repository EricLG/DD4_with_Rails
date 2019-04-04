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

ActiveRecord::Schema.define(version: 2019_03_30_074300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "abilities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ability_bonuses", id: :serial, force: :cascade do |t|
    t.integer "character_id"
    t.integer "ability_id"
    t.integer "total_value", default: 0
    t.integer "initial_value", default: 0
    t.integer "bonus_racial", default: 0
    t.integer "bonus_klass", default: 0
    t.integer "level_4", default: 0
    t.integer "level_8", default: 0
    t.integer "level_11", default: 0
    t.integer "level_14", default: 0
    t.integer "level_18", default: 0
    t.integer "level_21", default: 0
    t.integer "level_24", default: 0
    t.integer "level_28", default: 0
    t.integer "bonus_parangon", default: 0
    t.integer "bonus_epic", default: 0
    t.index ["ability_id"], name: "index_ability_bonuses_on_ability_id"
    t.index ["character_id"], name: "index_ability_bonuses_on_character_id"
  end

  create_table "armor_categories", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "heavy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_armor_categories_on_code"
  end

  create_table "armor_categories_klasses", id: false, force: :cascade do |t|
    t.integer "armor_category_id"
    t.integer "klass_id"
    t.index ["armor_category_id"], name: "index_armor_categories_klasses_on_armor_category_id"
    t.index ["klass_id"], name: "index_armor_categories_klasses_on_klass_id"
  end

  create_table "armor_categories_magic_items", id: false, force: :cascade do |t|
    t.integer "magic_item_id"
    t.integer "armor_category_id"
    t.index ["armor_category_id"], name: "index_armor_categories_magic_items_on_armor_category_id"
    t.index ["magic_item_id"], name: "index_armor_categories_magic_items_on_magic_item_id"
  end

  add_index "armor_categories_magic_items", ["armor_category_id"], name: "index_armor_categories_magic_items_on_armor_category_id", using: :btree
  add_index "armor_categories_magic_items", ["magic_item_id"], name: "index_armor_categories_magic_items_on_magic_item_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "texte"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "available_features", id: false, force: :cascade do |t|
    t.integer "feature_id"
    t.integer "klass_id"
    t.integer "race_id"
    t.index ["feature_id"], name: "index_available_features_on_feature_id"
    t.index ["klass_id"], name: "index_available_features_on_klass_id"
    t.index ["race_id"], name: "index_available_features_on_race_id"
  end

  create_table "campaigns", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "game_master_id"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.integer "level"
    t.string "parangon"
    t.string "epic"
    t.integer "age"
    t.string "height"
    t.string "weight"
    t.string "alignment"
    t.string "party"
    t.integer "status"
    t.hstore "stats"
    t.integer "user_id"
    t.integer "klass_id"
    t.integer "race_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "god_id"
    t.string "avatar"
  end

  create_table "characters_games", id: false, force: :cascade do |t|
    t.integer "character_id"
    t.integer "game_id"
    t.index ["character_id"], name: "index_characters_games_on_character_id"
    t.index ["game_id"], name: "index_characters_games_on_game_id"
  end

  create_table "choices", id: :serial, force: :cascade do |t|
    t.integer "character_id"
    t.integer "feature_id"
    t.integer "language_id"
    t.index ["character_id"], name: "index_choices_on_character_id"
    t.index ["feature_id"], name: "index_choices_on_feature_id"
    t.index ["language_id"], name: "index_choices_on_language_id"
  end

  create_table "chosen_feats", id: :serial, force: :cascade do |t|
    t.integer "character_id"
    t.integer "feat_id"
    t.string "information"
    t.boolean "free", default: false
    t.integer "weapon_group_id"
    t.integer "proficiency_id"
    t.integer "implement_group_id"
    t.integer "ability_id"
    t.integer "skill_id"
    t.index ["ability_id"], name: "index_chosen_feats_on_ability_id"
    t.index ["character_id"], name: "index_chosen_feats_on_character_id"
    t.index ["feat_id"], name: "index_chosen_feats_on_feat_id"
    t.index ["implement_group_id"], name: "index_chosen_feats_on_implement_group_id"
    t.index ["proficiency_id"], name: "index_chosen_feats_on_proficiency_id"
    t.index ["skill_id"], name: "index_chosen_feats_on_skill_id"
    t.index ["weapon_group_id"], name: "index_chosen_feats_on_weapon_group_id"
  end

  create_table "chosen_feats_languages", id: false, force: :cascade do |t|
    t.integer "chosen_feat_id"
    t.integer "language_id"
    t.index ["chosen_feat_id"], name: "index_chosen_feats_languages_on_chosen_feat_id"
    t.index ["language_id"], name: "index_chosen_feats_languages_on_language_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "comment"
    t.integer "roleplay"
    t.integer "campaign_id"
    t.integer "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "character_id"
    t.index ["campaign_id"], name: "index_comments_on_campaign_id"
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "common_armors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "weight"
    t.string "price"
    t.integer "armor_bonus"
    t.integer "min_alteration_bonus"
    t.integer "skill_malus"
    t.integer "ms_malus"
    t.string "special"
    t.integer "source_id"
    t.integer "armor_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["armor_category_id"], name: "index_common_armors_on_armor_category_id"
    t.index ["source_id"], name: "index_common_armors_on_source_id"
  end

  create_table "common_weapons", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "weight"
    t.string "price"
    t.string "damage"
    t.string "proficiency"
    t.string "range"
    t.integer "two_handed"
    t.integer "source_id"
    t.integer "weapon_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["source_id"], name: "index_common_weapons_on_source_id"
    t.index ["weapon_category_id"], name: "index_common_weapons_on_weapon_category_id"
  end

  create_table "common_weapons_klasses", id: false, force: :cascade do |t|
    t.integer "common_weapon_id"
    t.integer "klass_id"
    t.index ["common_weapon_id"], name: "index_common_weapons_klasses_on_common_weapon_id"
    t.index ["klass_id"], name: "index_common_weapons_klasses_on_klass_id"
  end

  create_table "common_weapons_weapon_groups", id: false, force: :cascade do |t|
    t.integer "common_weapon_id"
    t.integer "weapon_group_id"
    t.index ["common_weapon_id"], name: "index_common_weapons_weapon_groups_on_common_weapon_id"
    t.index ["weapon_group_id"], name: "index_common_weapons_weapon_groups_on_weapon_group_id"
  end

  create_table "common_weapons_weapon_properties", id: false, force: :cascade do |t|
    t.integer "common_weapon_id"
    t.integer "weapon_property_id"
    t.index ["common_weapon_id"], name: "index_common_weapons_weapon_properties_on_common_weapon_id"
    t.index ["weapon_property_id"], name: "index_common_weapons_weapon_properties_on_weapon_property_id"
  end

  create_table "consumables", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "kind"
    t.string "alteration"
    t.string "property"
    t.string "power"
    t.string "special"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumables_object_levels", id: false, force: :cascade do |t|
    t.integer "consumable_id"
    t.integer "object_level_id"
    t.index ["consumable_id"], name: "index_consumables_object_levels_on_consumable_id"
    t.index ["object_level_id"], name: "index_consumables_object_levels_on_object_level_id"
  end

  create_table "encounters", id: :serial, force: :cascade do |t|
    t.integer "level"
    t.integer "experience"
    t.string "description"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_encounters_on_source_id"
  end

  create_table "feats", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "avantage"
    t.string "errata"
    t.string "prerequisited_power"
    t.string "prerequisited_skill"
    t.string "prerequisited_other"
    t.integer "top_feat_id"
    t.integer "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "prerequisites"
    t.boolean "only_eberron", default: false
    t.boolean "only_ro", default: false
    t.boolean "divine_channel", default: false
    t.string "required_abilities"
    t.index ["divine_channel"], name: "index_feats_on_divine_channel"
    t.index ["only_eberron"], name: "index_feats_on_only_eberron"
    t.index ["only_ro"], name: "index_feats_on_only_ro"
    t.index ["source_id"], name: "index_feats_on_source_id"
  end

  create_table "feats_pr_features", id: false, force: :cascade do |t|
    t.integer "feat_id"
    t.integer "feature_id"
    t.index ["feat_id"], name: "index_feats_pr_features_on_feat_id"
    t.index ["feature_id"], name: "index_feats_pr_features_on_feature_id"
  end

  create_table "feats_pr_klasses", id: false, force: :cascade do |t|
    t.integer "feat_id"
    t.integer "klass_id"
    t.index ["feat_id"], name: "index_feats_pr_klasses_on_feat_id"
    t.index ["klass_id"], name: "index_feats_pr_klasses_on_klass_id"
  end

  create_table "feats_pr_races", id: false, force: :cascade do |t|
    t.integer "feat_id"
    t.integer "race_id"
    t.index ["feat_id"], name: "index_feats_pr_races_on_feat_id"
    t.index ["race_id"], name: "index_feats_pr_races_on_race_id"
  end

  create_table "features", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.text "description"
    t.string "required", default: "required"
    t.integer "parent_feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["parent_feature_id"], name: "index_features_on_parent_feature_id"
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.datetime "played"
    t.text "description"
    t.integer "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.json "illustrations"
  end

  create_table "gods", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "rank"
    t.string "alignment"
    t.string "description"
    t.string "influence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "implement_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_implement_groups_on_code"
  end

  create_table "implement_groups_klasses", id: false, force: :cascade do |t|
    t.integer "implement_group_id"
    t.integer "klass_id"
    t.index ["implement_group_id"], name: "index_implement_groups_klasses_on_implement_group_id"
    t.index ["klass_id"], name: "index_implement_groups_klasses_on_klass_id"
  end

  create_table "klasses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "power_source"
    t.string "main_stats"
    t.string "defense_bonus"
    t.integer "base_hp"
    t.integer "hp_per_level"
    t.integer "healing_surge"
    t.integer "skills_number"
    t.string "options_creation"
    t.text "information"
    t.integer "available_skills_id"
    t.integer "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "required_skills"
    t.string "trained_skills"
    t.index ["source_id"], name: "index_klasses_on_source_id"
  end

  create_table "klasses_weapon_categories", id: false, force: :cascade do |t|
    t.integer "weapon_category_id"
    t.integer "klass_id"
    t.index ["klass_id"], name: "index_klasses_weapon_categories_on_klass_id"
    t.index ["weapon_category_id"], name: "index_klasses_weapon_categories_on_weapon_category_id"
  end

  create_table "languages", id: :serial, force: :cascade do |t|
    t.string "language"
    t.string "writing"
    t.string "spoken_by"
    t.text "description"
    t.boolean "level_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_locations_on_code"
  end

  create_table "magic_items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description", limit: 500
    t.string "alteration", limit: 500
    t.text "property"
    t.text "power"
    t.text "special"
    t.integer "source_id"
    t.integer "rarity"
    t.string "critical", limit: 500
    t.integer "implement_group_id"
    t.integer "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_magic_items_on_name"
    t.index ["source_id"], name: "index_magic_items_on_source_id"
  end

  create_table "magic_items_object_levels", id: false, force: :cascade do |t|
    t.integer "magic_item_id"
    t.integer "object_level_id"
    t.index ["magic_item_id"], name: "index_magic_items_object_levels_on_magic_item_id"
    t.index ["object_level_id"], name: "index_magic_items_object_levels_on_object_level_id"
  end

  create_table "magic_items_weapon_groups", id: false, force: :cascade do |t|
    t.integer "magic_item_id"
    t.integer "weapon_group_id"
    t.index ["magic_item_id"], name: "index_magic_items_weapon_groups_on_magic_item_id"
    t.index ["weapon_group_id"], name: "index_magic_items_weapon_groups_on_weapon_group_id"
  end

  create_table "monsters", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "main_role"
    t.string "second_role"
    t.boolean "leader"
    t.integer "level"
    t.string "category"
    t.integer "px"
    t.string "race"
    t.string "origin"
    t.string "keywords"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_monsters_on_source_id"
  end

  create_table "object_levels", id: :serial, force: :cascade do |t|
    t.integer "level"
    t.string "price"
    t.integer "alteration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "cons_price"
    t.index ["level"], name: "index_object_levels_on_level"
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "campaign_id"
    t.integer "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["campaign_id"], name: "index_players_on_campaign_id"
    t.index ["character_id"], name: "index_players_on_character_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "races", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "average_height"
    t.string "average_weight"
    t.string "cat_size"
    t.integer "speed"
    t.string "vision"
    t.string "language"
    t.integer "nb_language_sup", default: 0
    t.text "information"
    t.integer "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "ability_bonuses"
    t.string "skill_bonuses"
    t.index ["source_id"], name: "index_races_on_source_id"
  end

  create_table "skill_bonuses", id: :serial, force: :cascade do |t|
    t.integer "character_id"
    t.integer "skill_id"
    t.integer "ability_bonus_id"
    t.integer "armor", default: 0
    t.integer "alteration", default: 0
    t.integer "feat", default: 0
    t.integer "item", default: 0
    t.integer "klasse", default: 0
    t.integer "power", default: 0
    t.integer "proficiency", default: 0
    t.integer "shield", default: 0
    t.integer "racial", default: 0
    t.integer "training", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ability_bonus_id"], name: "index_skill_bonuses_on_ability_bonus_id"
    t.index ["character_id"], name: "index_skill_bonuses_on_character_id"
    t.index ["skill_id"], name: "index_skill_bonuses_on_skill_id"
  end

  create_table "skills", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_categories", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.boolean "ranged"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_weapon_categories_on_code"
  end

  create_table "weapon_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapon_properties", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishlists", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "magic_item_id"
    t.integer "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["character_id"], name: "index_wishlists_on_character_id"
    t.index ["magic_item_id"], name: "index_wishlists_on_magic_item_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "comments", "campaigns"
  add_foreign_key "comments", "characters"
  add_foreign_key "comments", "games"
  add_foreign_key "comments", "users"
  add_foreign_key "encounters", "sources"
  add_foreign_key "monsters", "sources"
end
