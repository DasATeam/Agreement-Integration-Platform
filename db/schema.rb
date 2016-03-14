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

ActiveRecord::Schema.define(version: 20160313194245) do

  create_table "agreement_channels", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "agreement_id"
    t.integer  "channel_type_id"
    t.string   "customprice"
  end

  create_table "agreements", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "PKSNumber",    null: false
    t.string   "ApproverName"
    t.string   "ApproverRole"
    t.integer  "merchant_id"
  end

  create_table "channel_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
    t.string   "name"
    t.string   "partner"
    t.string   "charge"
  end

  create_table "merchant_customer_supports", force: :cascade do |t|
    t.string  "email",       null: false
    t.string  "telephone"
    t.string  "emergency"
    t.integer "merchant_id"
  end

  create_table "merchant_operationals", force: :cascade do |t|
    t.string  "email",       null: false
    t.string  "telephone"
    t.string  "emergency"
    t.integer "merchant_id"
  end

  create_table "merchant_owners", force: :cascade do |t|
    t.string  "email",       null: false
    t.string  "name"
    t.string  "address"
    t.string  "telephone"
    t.integer "merchant_id"
  end

  create_table "merchant_pics", force: :cascade do |t|
    t.string  "email",       null: false
    t.string  "name"
    t.string  "address"
    t.string  "telephone"
    t.integer "merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.string   "city"
    t.string   "address"
    t.integer  "officestatus"
    t.string   "typeofproduct"
    t.string   "pricerange"
    t.date     "timesincestarted"
    t.integer  "ownershiptype"
    t.decimal  "revenueseachmonth"
    t.decimal  "creditcardpaymentratio"
    t.string   "registrationlink"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email",      null: false
    t.string   "pass"
    t.string   "role"
  end

end
