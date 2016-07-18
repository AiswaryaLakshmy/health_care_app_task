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

ActiveRecord::Schema.define(version: 20160715103811) do

  create_table "default_drug_lists", force: :cascade do |t|
    t.string   "drug_name"
    t.string   "dosage"
    t.string   "timing"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "custom_drug"
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "drug_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drug_id"
    t.string   "dosage"
    t.string   "timing"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "custom_drug"
    t.string   "drug_name"
  end

  add_index "medications", ["drug_id"], name: "index_medications_on_drug_id"
  add_index "medications", ["user_id"], name: "index_medications_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "First_name"
    t.string   "Last_name"
  end

end
