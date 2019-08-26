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

ActiveRecord::Schema.define(version: 2019_08_26_182804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultations", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "offer_id"
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_consultations_on_offer_id"
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
  end

  create_table "doctor_specialties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_doctor_specialties_on_specialty_id"
    t.index ["user_id"], name: "index_doctor_specialties_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "available"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "specialty_id"
    t.index ["doctor_id"], name: "index_offers_on_doctor_id"
    t.index ["specialty_id"], name: "index_offers_on_specialty_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_doctor", default: false
    t.string "professional_register"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consultations", "offers"
  add_foreign_key "consultations", "users", column: "patient_id"
  add_foreign_key "doctor_specialties", "specialties"
  add_foreign_key "doctor_specialties", "users"
  add_foreign_key "offers", "specialties"
  add_foreign_key "offers", "users", column: "doctor_id"
end
