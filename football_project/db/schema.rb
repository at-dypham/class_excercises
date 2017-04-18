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

ActiveRecord::Schema.define(version: 20170413100700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string  "name"
    t.integer "tournament_id"
    t.index ["tournament_id"], name: "index_groups_on_tournament_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "team_A_id"
    t.integer  "team_B_id"
    t.datetime "time"
    t.string   "score"
    t.integer  "kind"
    t.integer  "tournament_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id", using: :btree
  end

  create_table "penalties", force: :cascade do |t|
    t.string  "score"
    t.integer "match_id"
    t.index ["match_id"], name: "index_penalties_on_match_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "tournament_teams", id: :integer, default: -> { "nextval('tounament_teams_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "w"
    t.integer "d"
    t.integer "l"
    t.integer "gf"
    t.integer "ga"
    t.integer "gd"
    t.integer "pts"
    t.integer "group_id"
    t.integer "team_id"
    t.index ["group_id"], name: "index_tounament_teams_on_group_id", using: :btree
    t.index ["team_id"], name: "index_tounament_teams_on_team_id", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "groups", "tournaments"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "penalties", "matches"
  add_foreign_key "tournament_teams", "groups"
  add_foreign_key "tournament_teams", "teams"
end
