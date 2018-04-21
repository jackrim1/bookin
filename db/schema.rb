ActiveRecord::Schema.define(version: 20180420135950) do

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
    t.index ["mess_id"], name: "index_events_on_mess_id"
  end

  create_table "messes", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alacarte"
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
