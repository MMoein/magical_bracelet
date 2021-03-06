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

ActiveRecord::Schema.define(version: 20150520094106) do

  create_table "actions", force: :cascade do |t|
    t.boolean  "shake"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "colour"
  end

  create_table "bracelet_actions", force: :cascade do |t|
    t.integer  "color"
    t.boolean  "shake"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bracelets", force: :cascade do |t|
    t.integer  "color"
    t.integer  "user_id"
    t.boolean  "is_shaking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bracelets", ["user_id"], name: "index_bracelets_on_user_id"

  create_table "custom_events", force: :cascade do |t|
    t.string   "token"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_requests", force: :cascade do |t|
    t.integer  "User_id"
    t.integer  "CustomEvent_id"
    t.boolean  "is_used"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "description"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "until_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "membership_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "bracelet_id"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "notifs", force: :cascade do |t|
    t.datetime "date"
    t.integer  "rule_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "is_consumed"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "rules", force: :cascade do |t|
    t.integer  "bracelet_id"
    t.integer  "action_id"
    t.integer  "event_id"
    t.integer  "until_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "group_id"
    t.integer  "user_id"
    t.integer  "weather_events_id"
    t.integer  "custom_events_id"
  end

  add_index "rules", ["custom_events_id"], name: "index_rules_on_custom_events_id"
  add_index "rules", ["group_id"], name: "index_rules_on_group_id"
  add_index "rules", ["user_id"], name: "index_rules_on_user_id"
  add_index "rules", ["weather_events_id"], name: "index_rules_on_weather_events_id"

  create_table "untils", force: :cascade do |t|
    t.integer  "rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weather_events", force: :cascade do |t|
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "weather",    default: "sunny", null: false
  end

end
