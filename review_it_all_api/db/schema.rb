# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_15_173115) do

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "subject_id", null: false
    t.integer "user_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_reviews_on_subject_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.text "description"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "review_id", null: false
    t.integer "user_id", null: false
    t.integer "sentiment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_votes_on_review_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "reviews", "subjects"
  add_foreign_key "reviews", "users"
  add_foreign_key "votes", "reviews"
  add_foreign_key "votes", "users"
end
