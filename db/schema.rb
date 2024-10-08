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

ActiveRecord::Schema.define(version: 20240912171917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"
  enable_extension "uuid-ossp"

  create_table "emails", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.uuid     "senderId"
    t.uuid     "receiverId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiverId"], name: "index_emails_on_receiverId", using: :btree
    t.index ["senderId"], name: "index_emails_on_senderId", using: :btree
  end

  create_table "roles", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "email",               null: false
    t.string   "password_digest"
    t.string   "username",            null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "confirmed"
    t.string   "confirm_email_token"
    t.uuid     "role_id"
  end

  add_foreign_key "emails", "users", column: "receiverId"
  add_foreign_key "emails", "users", column: "senderId"
end
