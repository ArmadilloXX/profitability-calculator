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

ActiveRecord::Schema.define(version: 20170713061609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "borrowers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_plans", force: :cascade do |t|
    t.string "name"
    t.float "basic_rate"
    t.integer "duration"
  end

  create_table "loans", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "borrower_id"
    t.bigint "loan_plan_id"
    t.float "received_sum"
    t.float "expected_sum"
    t.index ["borrower_id"], name: "index_loans_on_borrower_id"
    t.index ["loan_plan_id"], name: "index_loans_on_loan_plan_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.bigint "loan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_period"
    t.boolean "overdue"
    t.index ["loan_id"], name: "index_payments_on_loan_id"
  end

  add_foreign_key "loans", "borrowers"
  add_foreign_key "loans", "loan_plans"
  add_foreign_key "payments", "loans"
end
