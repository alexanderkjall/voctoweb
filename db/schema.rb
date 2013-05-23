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

ActiveRecord::Schema.define(version: 20130821000003) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "api_keys", force: true do |t|
    t.string   "key"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", force: true do |t|
    t.string   "acronym"
    t.string   "recordings_path"
    t.string   "images_path"
    t.string   "webgen_location"
    t.string   "aspect_ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "conferences", ["acronym"], name: "index_conferences_on_acronym"

  create_table "events", force: true do |t|
    t.string   "guid"
    t.string   "gif_filename"
    t.string   "poster_filename"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "events", ["conference_id"], name: "index_events_on_conference_id"
  add_index "events", ["guid"], name: "index_events_on_guid"
  add_index "events", ["title"], name: "index_events_on_title"

  create_table "recordings", force: true do |t|
    t.integer  "size"
    t.integer  "length"
    t.string   "mime_type"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path"
    t.string   "state",        default: "new", null: false
  end

  add_index "recordings", ["event_id"], name: "index_recordings_on_event_id"
  add_index "recordings", ["mime_type"], name: "index_recordings_on_mime_type"
  add_index "recordings", ["path"], name: "index_recordings_on_path"
  add_index "recordings", ["state"], name: "index_recordings_on_state"

end
