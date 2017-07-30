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

ActiveRecord::Schema.define(version: 20170730162859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.text "name"
    t.datetime "initial_meet"
    t.text "organization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "relationship"
  end

  create_table "contact_points", force: :cascade do |t|
    t.date "date"
    t.text "location"
    t.text "event"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "connection_id"
    t.index ["connection_id"], name: "index_contact_points_on_connection_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "connection_id"
    t.index ["connection_id"], name: "index_notes_on_connection_id"
  end

  create_table "user_connections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "connection_id"
    t.index ["connection_id"], name: "index_user_connections_on_connection_id"
    t.index ["user_id"], name: "index_user_connections_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "contact_points", "connections"
  add_foreign_key "notes", "connections"
  add_foreign_key "user_connections", "connections"
  add_foreign_key "user_connections", "users"
end
