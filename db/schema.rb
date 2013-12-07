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

ActiveRecord::Schema.define(version: 20131207042242) do

  create_table "poems", force: true do |t|
    t.integer  "venue_id"
    t.integer  "organization_id"
    t.string   "title"
    t.date     "date"
    t.text     "text"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poet_id"
    t.string   "link"
  end

  create_table "poets", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "website"
    t.text     "bio"
    t.string   "facebook"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tumblr"
    t.string   "youtube"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
