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

ActiveRecord::Schema[7.1].define(version: 2025_09_19_141519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.bigint "candidate_profile_id", null: false
    t.bigint "job_offer_id", null: false
    t.integer "status"
    t.text "motivation_letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_profile_id"], name: "index_applications_on_candidate_profile_id"
    t.index ["job_offer_id"], name: "index_applications_on_job_offer_id"
  end

  create_table "candidate_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "current_position"
    t.integer "years_of_experience"
    t.jsonb "skills"
    t.string "location"
    t.string "linkedin_url"
    t.boolean "looking_for_job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_candidate_profiles_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "industry"
    t.string "size"
    t.string "location"
    t.string "website"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headhunter_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "agency_id", null: false
    t.string "position"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_headhunter_profiles_on_agency_id"
    t.index ["user_id"], name: "index_headhunter_profiles_on_user_id"
  end

  create_table "job_offers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "requirements"
    t.string "location"
    t.string "contract_type"
    t.string "salary_range"
    t.string "published_by_type", null: false
    t.bigint "published_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["published_by_type", "published_by_id"], name: "index_job_offers_on_published_by"
  end

  create_table "recruiter_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.string "position"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_recruiter_profiles_on_company_id"
    t.index ["user_id"], name: "index_recruiter_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "location"
    t.string "linkedin_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "candidate_profiles"
  add_foreign_key "applications", "job_offers"
  add_foreign_key "candidate_profiles", "users"
  add_foreign_key "headhunter_profiles", "agencies"
  add_foreign_key "headhunter_profiles", "users"
  add_foreign_key "recruiter_profiles", "companies"
  add_foreign_key "recruiter_profiles", "users"
end
