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

ActiveRecord::Schema.define(version: 20170925021832) do

  create_table "cars", force: :cascade do |t|
    t.string "licensePlateNumber", null: false
    t.string "manufacturer"
    t.string "model"
    t.float "hourlyRentalRate"
    t.string "style"
    t.string "location"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["licensePlateNumber"], name: "index_cars_on_licensePlateNumber", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "checkOutTime", null: false
    t.datetime "pickUpTime"
    t.datetime "expectedReturnTime", null: false
    t.datetime "returnTime"
    t.string "reservationStatus", default: "Awaiting"
    t.integer "user_id"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_reservations_on_car_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "role", default: "Customer"
    t.float "rentalCharge", default: 0.0
    t.string "notification", default: ""
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
