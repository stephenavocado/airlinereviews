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

ActiveRecord::Schema.define(version: 2022_03_30_234914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "education_modules", force: :cascade do |t|
    t.integer "module_id"
    t.integer "status", default: 0
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_journals", force: :cascade do |t|
    t.integer "user_id"
    t.string "breakfast"
    t.string "lunch"
    t.string "dinner"
    t.string "snacks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "meal"
    t.integer "feeling_before"
    t.integer "feeling_after"
    t.string "food"
  end

  create_table "pain_journals", force: :cascade do |t|
    t.integer "pain_score"
    t.integer "user_id"
    t.string "pain_setting"
    t.string "pain_feeling"
    t.string "who_with"
    t.string "other_notes"
    t.integer "pain_after_episode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "coping_array", default: [], array: true
    t.integer "pain_after"
    t.string "coping_strategies"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "score"
    t.bigint "airline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airline_id"], name: "index_reviews_on_airline_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "test"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", default: 0
    t.string "uid"
    t.integer "smart_goals_count"
    t.integer "pain_journals_count"
    t.integer "mood_journals_count"
    t.integer "food_journals_count"
    t.integer "education_modules_count"
    t.integer "movement_modules_count"
    t.integer "bookmarks_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "avg_pain_pre_start"
    t.integer "program_pace_goal", default: 0
  end

  add_foreign_key "reviews", "airlines"
end
