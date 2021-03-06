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

ActiveRecord::Schema.define(version: 20180422142528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "mess_id"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.datetime "bookin_time_start"
    t.datetime "bookin_time_cutoff"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "recurring"
    t.index ["mess_id"], name: "index_events_on_mess_id"
  end

  create_table "messes", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alacarte"
    t.time "break_start"
    t.time "break_finish"
    t.time "break_cutoff"
    t.time "lunch_start"
    t.time "lunch_finish"
    t.time "lunch_cutoff"
    t.time "dinner_start"
    t.time "dinner_finish"
    t.time "dinner_cutoff"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.bigint "mess_id"
    t.boolean "manager"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mess_id"], name: "index_users_on_mess_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "messes"
  add_foreign_key "users", "messes"
end
