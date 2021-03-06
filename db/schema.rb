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

ActiveRecord::Schema.define(version: 13) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.time "end_time"
    t.text "location"
    t.integer "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_groups", id: false, force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "group_id", null: false
    t.index ["event_id", "group_id"], name: "index_events_groups_on_event_id_and_group_id"
    t.index ["group_id", "event_id"], name: "index_events_groups_on_group_id_and_event_id"
  end

  create_table "events_interests", id: false, force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "interest_id", null: false
    t.index ["event_id", "interest_id"], name: "index_events_interests_on_event_id_and_interest_id"
    t.index ["interest_id", "event_id"], name: "index_events_interests_on_interest_id_and_event_id"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.index ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id"
    t.index ["user_id", "event_id"], name: "index_events_users_on_user_id_and_event_id"
  end

  create_table "groups", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contact_id"
    t.index ["contact_id"], name: "index_groups_on_contact_id"
  end

  create_table "groups_interests", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "interest_id", null: false
    t.index ["group_id", "interest_id"], name: "index_groups_interests_on_group_id_and_interest_id"
    t.index ["interest_id", "group_id"], name: "index_groups_interests_on_interest_id_and_group_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id"
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "interests", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.bigint "interest_id", null: false
    t.bigint "user_id", null: false
    t.index ["interest_id", "user_id"], name: "index_interests_users_on_interest_id_and_user_id"
    t.index ["user_id", "interest_id"], name: "index_interests_users_on_user_id_and_interest_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

end
