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

ActiveRecord::Schema.define(version: 2020_09_14_125321) do

  create_table "bookings", force: :cascade do |t|
    t.integer "teachers_id"
    t.integer "students_id"
    t.integer "schedules_id"
    t.integer "theory_lessons_id"
    t.integer "driving_lessons_id"
    t.string "type"
    t.string "title"
    t.datetime "start"
    t.integer "duration"
    t.string "status"
    t.string "cancel_reason"
    t.integer "cost"
    t.boolean "refunded"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driving_lessons_id"], name: "index_bookings_on_driving_lessons_id"
    t.index ["schedules_id"], name: "index_bookings_on_schedules_id"
    t.index ["students_id"], name: "index_bookings_on_students_id"
    t.index ["teachers_id"], name: "index_bookings_on_teachers_id"
    t.index ["theory_lessons_id"], name: "index_bookings_on_theory_lessons_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "driving_lessons", force: :cascade do |t|
    t.integer "companies_id"
    t.integer "teachers_id"
    t.integer "schedules_id"
    t.integer "bookings_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookings_id"], name: "index_driving_lessons_on_bookings_id"
    t.index ["companies_id"], name: "index_driving_lessons_on_companies_id"
    t.index ["schedules_id"], name: "index_driving_lessons_on_schedules_id"
    t.index ["teachers_id"], name: "index_driving_lessons_on_teachers_id"
  end

  create_table "lesson_attachments", force: :cascade do |t|
    t.integer "theory_lessons_id"
    t.integer "driving_lessons_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driving_lessons_id"], name: "index_lesson_attachments_on_driving_lessons_id"
    t.index ["theory_lessons_id"], name: "index_lesson_attachments_on_theory_lessons_id"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "oauth_openid_requests", force: :cascade do |t|
    t.integer "access_grant_id", null: false
    t.string "nonce", null: false
    t.index ["access_grant_id"], name: "index_oauth_openid_requests_on_access_grant_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "users_id"
    t.string "portrait"
    t.string "first_name"
    t.string "last_name"
    t.string "family_name"
    t.string "registration_number"
    t.string "gender"
    t.date "birthday"
    t.string "mobile_number"
    t.string "tel_number"
    t.string "home_address"
    t.string "work_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_profiles_on_users_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "teachers_id"
    t.integer "driving_lessons_id"
    t.integer "theory_lessons_id"
    t.string "title"
    t.string "status"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["driving_lessons_id"], name: "index_schedules_on_driving_lessons_id"
    t.index ["teachers_id"], name: "index_schedules_on_teachers_id"
    t.index ["theory_lessons_id"], name: "index_schedules_on_theory_lessons_id"
    t.index ["title"], name: "index_schedules_on_title"
  end

  create_table "students", force: :cascade do |t|
    t.integer "companies_id"
    t.integer "foreign_key_id"
    t.integer "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["companies_id"], name: "index_students_on_companies_id"
    t.index ["foreign_key_id"], name: "index_students_on_foreign_key_id"
    t.index ["users_id"], name: "index_students_on_users_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "companies_id"
    t.integer "foreign_key_id"
    t.integer "users_id"
    t.string "title"
    t.string "experience"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["companies_id"], name: "index_teachers_on_companies_id"
    t.index ["foreign_key_id"], name: "index_teachers_on_foreign_key_id"
    t.index ["users_id"], name: "index_teachers_on_users_id"
  end

  create_table "theory_exam_attachments", force: :cascade do |t|
    t.integer "theory_exams_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theory_exams_id"], name: "index_theory_exam_attachments_on_theory_exams_id"
  end

  create_table "theory_exams", force: :cascade do |t|
    t.integer "company_id"
    t.integer "teachers_id"
    t.integer "foreign_key_id"
    t.integer "students_id"
    t.string "title"
    t.integer "duration"
    t.text "content"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_theory_exams_on_company_id"
    t.index ["foreign_key_id"], name: "index_theory_exams_on_foreign_key_id"
    t.index ["students_id"], name: "index_theory_exams_on_students_id"
    t.index ["teachers_id"], name: "index_theory_exams_on_teachers_id"
  end

  create_table "theory_lessons", force: :cascade do |t|
    t.integer "companies_id"
    t.integer "teachers_id"
    t.integer "schedules_id"
    t.integer "bookings_id"
    t.string "title"
    t.integer "duration"
    t.string "category"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookings_id"], name: "index_theory_lessons_on_bookings_id"
    t.index ["companies_id"], name: "index_theory_lessons_on_companies_id"
    t.index ["schedules_id"], name: "index_theory_lessons_on_schedules_id"
    t.index ["teachers_id"], name: "index_theory_lessons_on_teachers_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "driving_lessons", column: "driving_lessons_id", on_delete: :cascade
  add_foreign_key "bookings", "schedules", column: "schedules_id", on_delete: :cascade
  add_foreign_key "bookings", "students", column: "students_id", on_delete: :cascade
  add_foreign_key "bookings", "teachers", column: "teachers_id", on_delete: :cascade
  add_foreign_key "bookings", "theory_lessons", column: "theory_lessons_id", on_delete: :cascade
  add_foreign_key "driving_lessons", "teachers", column: "teachers_id", on_delete: :cascade
  add_foreign_key "lesson_attachments", "driving_lessons", column: "driving_lessons_id", on_delete: :cascade
  add_foreign_key "lesson_attachments", "theory_lessons", column: "theory_lessons_id", on_delete: :cascade
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_openid_requests", "oauth_access_grants", column: "access_grant_id", on_delete: :cascade
  add_foreign_key "profiles", "users", column: "users_id", on_delete: :cascade
  add_foreign_key "schedules", "driving_lessons", column: "driving_lessons_id", on_delete: :cascade
  add_foreign_key "schedules", "teachers", column: "teachers_id", on_delete: :cascade
  add_foreign_key "schedules", "theory_lessons", column: "theory_lessons_id", on_delete: :cascade
  add_foreign_key "students", "users", column: "users_id"
  add_foreign_key "teachers", "users", column: "users_id"
  add_foreign_key "theory_exam_attachments", "theory_exams", column: "theory_exams_id"
  add_foreign_key "theory_exams", "companies"
end
