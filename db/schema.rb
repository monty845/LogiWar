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

ActiveRecord::Schema.define(version: 20151116171845) do

  create_table "alignments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mapitems", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "item_id"
    t.integer  "health"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "orgname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "token"
    t.string   "display_name"
    t.string   "location"
    t.string   "gender"
    t.string   "title"
    t.string   "orgtype"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "org_id"
    t.integer  "alignment_id"
    t.integer  "buildpts"
  end

  create_table "users_users", id: false, force: :cascade do |t|
    t.integer  "friender"
    t.integer  "friend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
