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

ActiveRecord::Schema.define(version: 20200311053243) do

  create_table "animes", force: :cascade do |t|
    t.string "english_title"
    t.string "japanese_title"
    t.string "kanji_title"
    t.string "synopsis"
    t.string "avg_rating"
    t.string "start_date"
    t.string "end_date"
    t.string "age_rating"
    t.string "age_rating_guide"
    t.string "poster_img_tiny"
    t.string "poster_img_small"
    t.string "poster_img_medium"
    t.string "poster_img_large"
    t.string "poster_img_original"
    t.integer "num_of_episodes"
    t.string "youtube_link"
    t.boolean "nsfw"
  end

  create_table "user_animes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "anime_id"
    t.integer "current_episode", default: 1
    t.string "reminder", default: "No Reminder Set"
    t.index ["anime_id"], name: "index_user_animes_on_anime_id"
    t.index ["user_id"], name: "index_user_animes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
  end

end
