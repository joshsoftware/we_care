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

ActiveRecord::Schema.define(version: 2021_09_20_065742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auction_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "min_bid_amount"
    t.float "current_bid_amount"
    t.bigint "user_id"
    t.bigint "auction_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.index ["auction_id"], name: "index_auction_items_on_auction_id"
    t.index ["user_id"], name: "index_auction_items_on_user_id"
  end

  create_table "auctions", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string "address"
    t.string "name"
    t.string "banner_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bids", force: :cascade do |t|
    t.string "email"
    t.string "mobile"
    t.float "bid_amount"
    t.bigint "auction_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["auction_item_id"], name: "index_bids_on_auction_item_id"
  end

  create_table "item_attachments", force: :cascade do |t|
    t.string "file_url"
    t.bigint "auction_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_item_id"], name: "index_item_attachments_on_auction_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "mobile_number"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "auction_items"
end
