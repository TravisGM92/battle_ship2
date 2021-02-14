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

ActiveRecord::Schema.define(version: 2021_02_14_202117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.bigint "user_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "cells", force: :cascade do |t|
    t.string "coordinate"
    t.string "state", default: "empty"
    t.bigint "board_id"
    t.bigint "ship_id"
    t.index ["board_id"], name: "index_cells_on_board_id"
    t.index ["ship_id"], name: "index_cells_on_ship_id"
  end

  create_table "games", force: :cascade do |t|
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.bigint "user_id"
    t.bigint "board_id"
    t.index ["board_id"], name: "index_ships_on_board_id"
    t.index ["user_id"], name: "index_ships_on_user_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "turn_number"
    t.string "player_to_move"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_turns_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "turn_id"
    t.index ["turn_id"], name: "index_users_on_turn_id"
  end

  add_foreign_key "boards", "users"
  add_foreign_key "cells", "boards"
  add_foreign_key "cells", "ships"
  add_foreign_key "ships", "boards"
  add_foreign_key "ships", "users"
  add_foreign_key "turns", "games"
  add_foreign_key "users", "turns"
end
