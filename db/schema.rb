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

ActiveRecord::Schema.define(version: 20161118194318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issue_payloads", force: :cascade do |t|
    t.json     "payload",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_tokens", force: :cascade do |t|
    t.string "addon_key"
    t.string "client_key"
    t.string "shared_secret"
    t.string "product_type"
    t.string "base_url"
    t.string "api_base_url"
    t.index ["client_key"], name: "index_jwt_tokens_on_client_key", using: :btree
  end

  create_table "jwt_user_infos", force: :cascade do |t|
    t.integer "jwt_user_id", null: false
    t.string  "email",       null: false
    t.string  "time_zone",   null: false
  end

  create_table "jwt_user_settings", force: :cascade do |t|
    t.integer "jwt_user_id",    null: false
    t.string  "promoter_token"
  end

  create_table "jwt_users", force: :cascade do |t|
    t.integer "jwt_token_id"
    t.string  "user_key"
    t.string  "name"
    t.string  "display_name"
  end

  create_table "project_configurations", force: :cascade do |t|
    t.integer  "jwt_token_id"
    t.integer  "project_id",                  null: false
    t.string   "product_name", default: "",   null: false
    t.string   "language",     default: "en", null: false
    t.string   "reply_to",                    null: false
    t.string   "from",                        null: false
    t.string   "subject",                     null: false
    t.text     "introduction", default: "",   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["jwt_token_id", "project_id"], name: "index_project_configurations_on_jwt_token_id_and_project_id", unique: true, using: :btree
    t.index ["jwt_token_id"], name: "index_project_configurations_on_jwt_token_id", using: :btree
  end

  create_table "service_links", force: :cascade do |t|
    t.text     "label"
    t.text     "href"
    t.text     "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typeform_payloads", force: :cascade do |t|
    t.string   "event_id",   null: false
    t.json     "payload",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "jwt_user_infos", "jwt_users", on_delete: :cascade
  add_foreign_key "jwt_user_settings", "jwt_users", on_delete: :cascade
  add_foreign_key "project_configurations", "jwt_tokens"
end
