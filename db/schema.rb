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

ActiveRecord::Schema[7.1].define(version: 2024_05_16_141156) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "impulse_purchases", force: :cascade do |t|
    t.string "title", null: false
    t.integer "purchase_amount", null: false
    t.integer "hourly_wage", null: false
    t.decimal "operating_time", null: false
    t.string "comment"
    t.integer "privacy"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_impulse_purchases_on_user_id"
  end

  create_table "operation_plans", force: :cascade do |t|
    t.date "start_on"
    t.date "completion_on"
    t.boolean "remind"
    t.string "task"
    t.bigint "impulse_purchase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["impulse_purchase_id"], name: "index_operation_plans_on_impulse_purchase_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "nickname"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "week_schedules", force: :cascade do |t|
    t.integer "monday_work_time"
    t.integer "tuesday_work_time"
    t.integer "Wednes_daywork_time"
    t.integer "Thursday_work_time"
    t.integer "Friday_work_time"
    t.integer "Saturday_work_time"
    t.integer "Sunday_work_time"
    t.bigint "operation_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_plan_id"], name: "index_week_schedules_on_operation_plan_id"
  end

  add_foreign_key "impulse_purchases", "users"
  add_foreign_key "operation_plans", "impulse_purchases"
  add_foreign_key "week_schedules", "operation_plans"
end
