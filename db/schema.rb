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

ActiveRecord::Schema.define(version: 20171128142753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string "attachinariable_type"
    t.bigint "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
    t.index ["attachinariable_type", "attachinariable_id"], name: "index_attachinariable"
  end

  create_table "consults", force: :cascade do |t|
    t.date "consult_date"
    t.string "unit_cnes"
    t.string "team_number"
    t.integer "professional_id"
    t.integer "patient_id"
    t.integer "place"
    t.integer "turn"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "ciap_code"
    t.string "formal_name"
    t.string "pop_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_diagnosis"
  end

  create_table "patient_problems", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "disease_id"
    t.text "comment"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_patient_problems_on_disease_id"
    t.index ["patient_id"], name: "index_patient_problems_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "full_name"
    t.date "birthday"
    t.string "sus_number"
    t.string "address"
    t.string "prontuario_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "full_name"
    t.string "professional_number"
    t.string "photo"
    t.date "birthday"
    t.string "profession"
    t.string "sus_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "unit_cnes"
    t.string "team_number"
    t.string "google_photo"
    t.index ["user_id"], name: "index_professionals_on_user_id"
  end

  create_table "soaps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "exams"
    t.text "referring"
    t.bigint "complaint_id"
    t.bigint "diagnosis_id"
    t.bigint "consult_id"
    t.index ["complaint_id"], name: "index_soaps_on_complaint_id"
    t.index ["consult_id"], name: "index_soaps_on_consult_id"
    t.index ["diagnosis_id"], name: "index_soaps_on_diagnosis_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "patient_problems", "diseases"
  add_foreign_key "patient_problems", "patients"
  add_foreign_key "professionals", "users"
  add_foreign_key "soaps", "consults"
  add_foreign_key "soaps", "diseases", column: "complaint_id"
  add_foreign_key "soaps", "diseases", column: "diagnosis_id"
end
