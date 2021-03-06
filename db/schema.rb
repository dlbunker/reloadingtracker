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

ActiveRecord::Schema.define(version: 20160208172025) do

  create_table "calibers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "metric"
    t.decimal  "inches"
    t.string   "cal_type"
    t.decimal  "mm"
  end

  create_table "loads", force: :cascade do |t|
    t.string   "name"
    t.string   "caliber"
    t.integer  "primer_id"
    t.integer  "bullet_id"
    t.integer  "powder_id"
    t.decimal  "charge"
    t.decimal  "trim"
    t.decimal  "oal"
    t.decimal  "velocity"
    t.text     "notes"
    t.datetime "load_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qty"
    t.integer  "caliber_id"
  end

  add_index "loads", ["caliber_id"], name: "index_loads_on_caliber_id"
  add_index "loads", ["user_id"], name: "index_loads_on_user_id"

  create_table "supplies", force: :cascade do |t|
    t.integer  "user_id",                                             null: false
    t.integer  "product_id"
    t.string   "product_type"
    t.decimal  "cost",         precision: 2, scale: 10, default: 0.0, null: false
    t.integer  "cost_qty",                              default: 1,   null: false
    t.integer  "onhand",                                default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supplies", ["onhand"], name: "index_supplies_on_onhand"
  add_index "supplies", ["product_type", "product_id"], name: "index_supplies_on_product_type_and_product_id"

  create_table "traits", force: :cascade do |t|
    t.string   "attr_name",                 null: false
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "supply_id",              null: false
    t.string   "trans_type",             null: false
    t.integer  "qty",        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["qty"], name: "index_transactions_on_qty"
  add_index "transactions", ["supply_id"], name: "index_transactions_on_supply_id"
  add_index "transactions", ["trans_type"], name: "index_transactions_on_trans_type"

  create_table "users", force: :cascade do |t|
    t.string   "provider",                               null: false
    t.string   "uid",                    default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

end
