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

ActiveRecord::Schema.define(version: 20160501220928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreement_channels", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "agreement_id"
    t.integer  "channel_type_id"
    t.string   "customprice"
  end

  create_table "agreements", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "pks_number",    null: false
    t.string   "approver_name"
    t.string   "approver_role"
    t.integer  "merchant_id"
    t.boolean  "has_agree"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string  "acc_number",  null: false
    t.string  "name"
    t.string  "acc_holder"
    t.string  "acc_type"
    t.integer "merchant_id"
  end

  create_table "channel_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
    t.string   "name"
    t.string   "partner"
    t.string   "charge"
  end

  create_table "channel_types_document_types", force: :cascade do |t|
    t.integer "document_type_id"
    t.integer "channel_type_id"
  end

  add_index "channel_types_document_types", ["channel_type_id"], name: "index_channel_types_document_types_on_channel_type_id", using: :btree
  add_index "channel_types_document_types", ["document_type_id"], name: "index_channel_types_document_types_on_document_type_id", using: :btree

  create_table "document_links", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "document_type_id"
    t.string   "link"
  end

  create_table "document_paths", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "merchant_document_id"
    t.string   "path"
  end

  add_index "document_paths", ["merchant_document_id"], name: "index_document_paths_on_merchant_document_id", using: :btree

  create_table "document_types", force: :cascade do |t|
    t.string  "name"
    t.boolean "is_additional"
  end

  create_table "merchant_customer_supports", force: :cascade do |t|
    t.string  "email",        null: false
    t.string  "telephone"
    t.string  "emergency"
    t.integer "merchant_id"
    t.boolean "is_completed"
  end

  create_table "merchant_documents", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "merchant_id"
    t.integer  "agreement_id"
    t.integer  "document_type_id"
    t.string   "path"
    t.string   "file"
  end

  add_index "merchant_documents", ["agreement_id"], name: "index_merchant_documents_on_agreement_id", using: :btree
  add_index "merchant_documents", ["merchant_id"], name: "index_merchant_documents_on_merchant_id", using: :btree

  create_table "merchant_operationals", force: :cascade do |t|
    t.string  "email",        null: false
    t.string  "telephone"
    t.string  "emergency"
    t.integer "merchant_id"
    t.boolean "is_completed"
  end

  create_table "merchant_owners", force: :cascade do |t|
    t.string  "email",        null: false
    t.string  "name"
    t.string  "address"
    t.string  "telephone"
    t.integer "merchant_id"
    t.boolean "is_completed"
  end

  create_table "merchant_pics", force: :cascade do |t|
    t.string  "email",        null: false
    t.string  "name"
    t.string  "address"
    t.string  "telephone"
    t.integer "merchant_id"
    t.boolean "is_completed"
  end

  create_table "merchants", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.string   "city"
    t.string   "address"
    t.integer  "office_status"
    t.string   "type_of_product"
    t.string   "price_range"
    t.date     "time_since_started"
    t.integer  "ownership_type"
    t.decimal  "revenues_each_month"
    t.decimal  "credit_card_payment_ratio"
    t.string   "registration_link"
    t.integer  "user_id"
    t.boolean  "info_is_completed"
    t.boolean  "documents_is_completed"
  end

  create_table "points", force: :cascade do |t|
    t.string   "isi"
    t.string   "nomor"
    t.integer  "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "points", ["point_id"], name: "index_points_on_point_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "user_id"
  end

  add_index "sales", ["user_id"], name: "index_sales_on_user_id", using: :btree

  create_table "sales_merchants", force: :cascade do |t|
    t.integer  "merchant_id"
    t.integer  "sales_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sales_merchants", ["merchant_id"], name: "index_sales_merchants_on_merchant_id", using: :btree
  add_index "sales_merchants", ["sales_id"], name: "index_sales_merchants_on_sales_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email",      null: false
    t.string   "pass"
    t.string   "role"
    t.string   "salt"
  end

  add_foreign_key "agreement_channels", "agreements"
  add_foreign_key "agreement_channels", "channel_types"
  add_foreign_key "agreements", "merchants"
  add_foreign_key "bank_accounts", "merchants"
  add_foreign_key "channel_types_document_types", "channel_types"
  add_foreign_key "channel_types_document_types", "document_types"
  add_foreign_key "document_links", "document_types"
  add_foreign_key "document_paths", "merchant_documents"
  add_foreign_key "merchant_customer_supports", "merchants"
  add_foreign_key "merchant_documents", "agreements"
  add_foreign_key "merchant_documents", "document_types"
  add_foreign_key "merchant_documents", "merchants"
  add_foreign_key "merchant_operationals", "merchants"
  add_foreign_key "merchant_owners", "merchants"
  add_foreign_key "merchant_pics", "merchants"
  add_foreign_key "merchants", "users"
  add_foreign_key "points", "points"
  add_foreign_key "sales", "users"
  add_foreign_key "sales_merchants", "merchants"
  add_foreign_key "sales_merchants", "sales", column: "sales_id"
end
