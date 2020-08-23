# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_22_041356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_messages", force: :cascade do |t|
    t.text "message"
    t.datetime "posted_at"
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_chat_messages_on_chat_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.datetime "start_time"
    t.boolean "is_closed"
    t.bigint "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_chats_on_session_id"
  end

  create_table "mentor_reviews", force: :cascade do |t|
    t.decimal "rating"
    t.text "description"
    t.bigint "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_mentor_reviews_on_session_id"
  end

  create_table "mentor_skills", force: :cascade do |t|
    t.bigint "mentor_id", null: false
    t.bigint "skill_id", null: false
    t.integer "expertise"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentor_id"], name: "index_mentor_skills_on_mentor_id"
    t.index ["skill_id"], name: "index_mentor_skills_on_skill_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "rate_minutes"
    t.decimal "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mentors_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "scheduled_start_time"
    t.datetime "actual_start_time"
    t.integer "scheduled_minutes"
    t.integer "actual_minutes"
    t.text "topic"
    t.bigint "mentor_user_id", null: false
    t.bigint "mentee_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentee_user_id"], name: "index_sessions_on_mentee_user_id"
    t.index ["mentor_user_id"], name: "index_sessions_on_mentor_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_hash"
    t.string "username"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_messages", "chats"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "chats", "sessions"
  add_foreign_key "mentor_reviews", "sessions"
  add_foreign_key "mentor_skills", "mentors"
  add_foreign_key "mentor_skills", "skills"
  add_foreign_key "mentors", "users"
  add_foreign_key "sessions", "users", column: "mentee_user_id"
  add_foreign_key "sessions", "users", column: "mentor_user_id"
end
