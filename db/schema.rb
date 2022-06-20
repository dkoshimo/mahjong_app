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

ActiveRecord::Schema.define(version: 2022_06_13_050853) do

  create_table "games", force: :cascade do |t|
    t.string "uma"
    t.integer "rate"
    t.integer "tip"
    t.string "name"
    t.string "player1"
    t.string "player2"
    t.string "player3"
    t.string "player4"
    t.integer "authorID"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "gameID"
    t.string "playerID"
    t.integer "score"
    t.integer "ranking"
    t.string "game_num"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

end
