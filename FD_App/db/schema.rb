# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150831070523) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "account_number", limit: 4
    t.integer  "user_id",        limit: 4
    t.string   "type_account",   limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "balance",        limit: 24
  end

  create_table "deposits", force: :cascade do |t|
    t.integer  "account_id",        limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "tenure_in_years",   limit: 4
    t.integer  "tenure_in_months",  limit: 4
    t.integer  "tenure_in_days",    limit: 4
    t.boolean  "maturity_proceeds"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "mobile",     limit: 255
    t.string   "pan",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
