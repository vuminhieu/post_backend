# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_22_050313) do

  create_table "categories", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
  end

  create_table "customers", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
  end

  create_table "foods", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.float "price"
    t.string "avatar"
    t.bigint "restaurant_id"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["category_id"], name: "index_foods_on_category_id"
    t.index ["restaurant_id"], name: "index_foods_on_restaurant_id"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "order_foods", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "food_id"
    t.integer "quantity"
    t.float "total_price"
    t.index ["food_id"], name: "index_order_foods_on_food_id"
    t.index ["order_id"], name: "index_order_foods_on_order_id"
  end

  create_table "orders", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "quantity"
    t.float "total_price"
    t.integer "status", default: 0
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["status"], name: "index_orders_on_status"
  end

  create_table "restaurants", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "role", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
