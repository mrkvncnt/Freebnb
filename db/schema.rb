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

ActiveRecord::Schema.define(version: 2019_04_09_133648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "img_url", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_features", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "amenity_id", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "guest_id", null: false
    t.integer "host_id", null: false
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.integer "num_guests", null: false
    t.integer "total_rate", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "guest_id", null: false
    t.text "body", null: false
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots", force: :cascade do |t|
    t.integer "host_id", null: false
    t.string "name", null: false
    t.string "accommodation", null: false
    t.integer "rate", null: false
    t.integer "num_guests", null: false
    t.integer "num_beds", null: false
    t.integer "num_baths", null: false
    t.string "img_url"
    t.text "description"
    t.string "city", null: false
    t.string "address", null: false
    t.float "lat", null: false
    t.float "lng", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ave_rating"
    t.index ["address"], name: "index_spots_on_address", unique: true
    t.index ["city"], name: "index_spots_on_city"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "img_url"
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

end
