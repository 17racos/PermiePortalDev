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

ActiveRecord::Schema[7.2].define(version: 2025_01_13_201936) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "image"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_guides_on_slug", unique: true
  end

  create_table "pests", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "picture"
    t.string "scientific_name"
    t.text "description"
    t.text "characteristics"
    t.text "control_methods"
    t.text "natural_enemies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pests_on_name", unique: true
    t.index ["slug"], name: "index_pests_on_slug", unique: true
  end

  create_table "plant_pests", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.bigint "pest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pest_id"], name: "index_plant_pests_on_pest_id"
    t.index ["plant_id", "pest_id"], name: "index_plant_pests_on_plant_id_and_pest_id", unique: true
    t.index ["plant_id"], name: "index_plant_pests_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "picture"
    t.string "common_name", null: false
    t.string "scientific_name"
    t.text "aka", default: [], array: true
    t.string "family"
    t.string "zone"
    t.string "ideal_temp_min"
    t.string "ideal_temp_max"
    t.string "min_temp"
    t.string "max_temp"
    t.boolean "perennial"
    t.text "layers", default: [], array: true
    t.text "plant_function", default: [], array: true
    t.text "description"
    t.text "purpose"
    t.text "avoid", default: [], array: true
    t.text "companions", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["common_name"], name: "index_plants_on_common_name", unique: true
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "plant_pests", "pests"
  add_foreign_key "plant_pests", "plants"
  add_foreign_key "resources", "users"
end
