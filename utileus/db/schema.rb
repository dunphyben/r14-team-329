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

ActiveRecord::Schema.define(version: 20141018023153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: true do |t|
    t.string  "name"
    t.string  "url"
    t.integer "list_id"
  end

  create_table "lists", force: true do |t|
    t.string   "name"
    t.text     "overview"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "quick_review"
    t.text     "full_review"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.integer  "profession_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["profession_id"], name: "index_users_on_profession_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
