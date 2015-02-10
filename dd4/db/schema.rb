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

ActiveRecord::Schema.define(version: 20150207143600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armor_categories", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "heavy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "common_armors", force: true do |t|
    t.string   "name"
    t.string   "weight"
    t.string   "price"
    t.string   "armor_bonus"
    t.boolean  "heavy"
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
    t.string   "type"
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

  create_table "common_weapons_weapon_groups", force: true do |t|
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

  create_table "sources", force: true do |t|
    t.string   "name"
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
