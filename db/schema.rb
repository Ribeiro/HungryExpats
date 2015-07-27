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

ActiveRecord::Schema.define(version: 20150727145723) do

  create_table "buildings", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "city_area_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "dish_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.float    "price",            limit: 24
    t.string   "picture",          limit: 255
    t.integer  "spiciness",        limit: 4
    t.boolean  "is_available",     limit: 1,     default: true
    t.boolean  "has_options",      limit: 1,     default: false
    t.boolean  "is_active",        limit: 1,     default: true
    t.integer  "restaurant_id",    limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "dish_category_id", limit: 4
  end

  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree

  create_table "food_styles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.string   "address",         limit: 255
    t.string   "picture",         limit: 255
    t.string   "phone_1",         limit: 255
    t.string   "phone_2",         limit: 255
    t.string   "qq",              limit: 255
    t.string   "qr_code",         limit: 255
    t.integer  "minimum_order",   limit: 4
    t.integer  "delivery_charge", limit: 4
    t.integer  "star_rating",     limit: 4
    t.boolean  "is_active",       limit: 1,     default: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "building_id",     limit: 4
    t.integer  "foodstyle_id",    limit: 4
  end

  add_index "restaurants", ["building_id"], name: "index_restaurants_on_building_id", using: :btree
  add_index "restaurants", ["foodstyle_id"], name: "index_restaurants_on_foodstyle_id", using: :btree

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "restaurants", "buildings"
end