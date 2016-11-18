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

ActiveRecord::Schema.define(version: 20161118233105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jwt_tokens", force: :cascade do |t|
    t.string "addon_key"
    t.string "client_key"
    t.string "shared_secret"
    t.string "product_type"
    t.string "base_url"
    t.string "api_base_url"
    t.index ["client_key"], name: "index_jwt_tokens_on_client_key", using: :btree
  end

  create_table "jwt_users", force: :cascade do |t|
    t.integer "jwt_token_id"
    t.string  "user_key"
    t.string  "name"
    t.string  "display_name"
  end

  create_table "service_links", force: :cascade do |t|
    t.text     "label"
    t.text     "href"
    t.text     "color"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "jwt_token_id", null: false
    t.integer  "project_id",   null: false
    t.integer  "position",     null: false
    t.index ["jwt_token_id"], name: "index_service_links_on_jwt_token_id", using: :btree
  end

  add_foreign_key "service_links", "jwt_tokens"
end
