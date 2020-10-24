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

ActiveRecord::Schema.define(version: 2020_10_24_091004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.bigint "phone_id", null: false
    t.bigint "user_id", null: false
    t.integer "quantity", null: false
    t.text "note"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_inventories_on_discarded_at"
    t.index ["phone_id"], name: "index_inventories_on_phone_id"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_manufacturers_on_name", unique: true
  end

  create_table "models", force: :cascade do |t|
    t.bigint "manufacturer_id", null: false
    t.string "name", null: false
    t.string "os_version", null: false
    t.integer "year_of_manufacture", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_models_on_discarded_at"
    t.index ["manufacturer_id"], name: "index_models_on_manufacturer_id"
    t.index ["name"], name: "index_models_on_name", unique: true
  end

  create_table "phones", force: :cascade do |t|
    t.string "body_color", null: false
    t.integer "data_memory", null: false
    t.decimal "price", null: false
    t.bigint "model_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "main_photo_file_name"
    t.string "main_photo_content_type"
    t.integer "main_photo_file_size"
    t.datetime "main_photo_updated_at"
    t.index ["discarded_at"], name: "index_phones_on_discarded_at"
    t.index ["model_id"], name: "index_phones_on_model_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inventories", "phones"
  add_foreign_key "inventories", "users"
  add_foreign_key "models", "manufacturers"
  add_foreign_key "phones", "models"
end
