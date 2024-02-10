# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_06_133555) do
  create_table "attendee_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_attendee_id", null: false
    t.integer "attended_event_id", null: false
    t.index ["attended_event_id"], name: "index_attendee_events_on_attended_event_id"
    t.index ["event_attendee_id"], name: "index_attendee_events_on_event_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "event_invited_id", null: false
    t.integer "invited_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_invited_id"], name: "index_invitations_on_event_invited_id"
    t.index ["invited_user_id"], name: "index_invitations_on_invited_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number", default: "default", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendee_events", "events", column: "attended_event_id"
  add_foreign_key "attendee_events", "users", column: "event_attendee_id"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "invitations", "events", column: "event_invited_id"
  add_foreign_key "invitations", "users", column: "invited_user_id"
end