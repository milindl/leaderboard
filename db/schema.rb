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

ActiveRecord::Schema.define(version: 20170620055231) do

  create_table "admin_users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "link"
    t.integer "user_id"
    t.text "desc"
    t.integer "status", default: 0, null: false
    t.string "typeof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "points"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cclogin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cclogin"], name: "index_users_on_cclogin", unique: true
  end

end
