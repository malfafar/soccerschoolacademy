# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160505162531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "coaches", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                   default: "", null: false
    t.string   "phone",                  default: "", null: false
  end

  add_index "coaches", ["email"], name: "index_coaches_on_email", unique: true, using: :btree
  add_index "coaches", ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true, using: :btree

  create_table "coaches_team_seasons", id: false, force: :cascade do |t|
    t.integer "coach_id"
    t.integer "team_season_id"
  end

  add_index "coaches_team_seasons", ["coach_id", "team_season_id"], name: "coaches_team_seasons_index", using: :btree

  create_table "competitions", force: :cascade do |t|
    t.integer  "nr_teams"
    t.boolean  "knockout"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "season_id"
  end

  add_index "competitions", ["season_id"], name: "index_competitions_on_season_id", using: :btree

  create_table "competitions_sponsors", force: :cascade do |t|
    t.integer "sponsor_id"
    t.integer "competition_id"
  end

  add_index "competitions_sponsors", ["sponsor_id", "competition_id"], name: "competitions_sponsors_index", using: :btree

  create_table "competitions_team_seasons", id: false, force: :cascade do |t|
    t.integer "competition_id"
    t.integer "team_season_id"
  end

  add_index "competitions_team_seasons", ["competition_id", "team_season_id"], name: "competitions_team_seasons_index", using: :btree

  create_table "documents", force: :cascade do |t|
    t.integer  "level"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "exams", force: :cascade do |t|
    t.date     "exam_date"
    t.string   "height"
    t.string   "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
  end

  create_table "guardian_auths", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "guardian_auths", ["confirmation_token"], name: "index_guardian_auths_on_confirmation_token", unique: true, using: :btree
  add_index "guardian_auths", ["email"], name: "index_guardian_auths_on_email", unique: true, using: :btree
  add_index "guardian_auths", ["reset_password_token"], name: "index_guardian_auths_on_reset_password_token", unique: true, using: :btree

  create_table "guardians", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "guardian_auth_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "matchday",          default: 0,  null: false
    t.integer  "home_goals",        default: -1, null: false
    t.integer  "away_goals",        default: -1, null: false
    t.string   "delegate1",         default: "", null: false
    t.string   "delegate2",         default: "", null: false
    t.string   "referee1",          default: "", null: false
    t.string   "referee2",          default: "", null: false
    t.string   "referee3",          default: "", null: false
    t.text     "home_observations", default: "", null: false
    t.text     "away_observations"
    t.text     "ref_observations"
    t.datetime "match_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "away_team_id"
    t.integer  "home_team_id"
    t.integer  "competition_id"
  end

  create_table "photos", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.boolean  "approved"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "main"
    t.boolean  "private"
    t.integer  "team_season_id"
    t.integer  "level",              default: -1,    null: false
    t.integer  "match_id"
    t.boolean  "video",              default: false, null: false
    t.string   "video_url",          default: "",    null: false
  end

  create_table "player_auths", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "player_auths", ["confirmation_token"], name: "index_player_auths_on_confirmation_token", unique: true, using: :btree
  add_index "player_auths", ["email"], name: "index_player_auths_on_email", unique: true, using: :btree
  add_index "player_auths", ["reset_password_token"], name: "index_player_auths_on_reset_password_token", unique: true, using: :btree

  create_table "player_practices", force: :cascade do |t|
    t.integer  "state",        default: 0, null: false
    t.integer  "practice_id"
    t.integer  "player_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "late_minutes", default: 0, null: false
  end

  create_table "player_seasons", force: :cascade do |t|
    t.integer  "shirt_number"
    t.float    "shoe_size"
    t.string   "shirt_name"
    t.integer  "team_season_id"
    t.integer  "player_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "player_seasons", ["team_season_id", "player_id"], name: "index_player_seasons_on_team_season_id_and_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.date     "birthday"
    t.text     "address",                default: "", null: false
    t.string   "district",               default: "", null: false
    t.string   "zipcode",                default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "birthplace",             default: "", null: false
    t.string   "nationality",            default: "", null: false
    t.string   "id_card_number",         default: "", null: false
    t.string   "vat_id",                 default: "", null: false
    t.string   "guardian_family_degree", default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "player_auth_id"
    t.integer  "guardian_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "second_parent",          default: "", null: false
    t.integer  "school_id"
    t.date     "medicals",               default: [],              array: true
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "private"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "level",              default: -1, null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "coach_id"
  end

  create_table "posts_team_seasons", force: :cascade do |t|
    t.integer "team_season_id"
    t.integer "post_id"
  end

  add_index "posts_team_seasons", ["post_id", "team_season_id"], name: "index_posts_team_seasons_on_post_id_and_team_season_id", using: :btree

  create_table "practices", force: :cascade do |t|
    t.datetime "practice_date"
    t.text     "observations"
    t.integer  "team_season_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "start_year"
    t.integer  "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "title"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.boolean  "homepage"
    t.string   "name"
    t.text     "description"
    t.text     "url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "sponsors_team_seasons", id: false, force: :cascade do |t|
    t.integer "sponsor_id"
    t.integer "team_season_id"
  end

  add_index "sponsors_team_seasons", ["sponsor_id", "team_season_id"], name: "sponsors_team_seasons_index", using: :btree

  create_table "statistics", force: :cascade do |t|
    t.boolean  "red",                 default: false, null: false
    t.integer  "goals",               default: 0,     null: false
    t.integer  "own_goals",           default: 0,     null: false
    t.integer  "state",               default: 0,     null: false
    t.boolean  "called",              default: true,  null: false
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "home",                default: true,  null: false
    t.boolean  "first_yellow",        default: false, null: false
    t.boolean  "second_yellow",       default: false, null: false
    t.integer  "played_minutes",      default: 0,     null: false
    t.integer  "penalties",           default: 0,     null: false
    t.integer  "assists",             default: 0,     null: false
    t.integer  "late_minutes",        default: 0,     null: false
    t.datetime "called_confirmation"
  end

  create_table "team_seasons", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "team_id"
    t.integer  "season_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "permission",         default: 0, null: false
  end

  add_index "team_seasons", ["season_id"], name: "index_team_seasons_on_season_id", using: :btree
  add_index "team_seasons", ["team_id"], name: "index_team_seasons_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "level",       default: 0,    null: false
    t.boolean  "n10",         default: true, null: false
  end

  add_foreign_key "competitions", "seasons"
  add_foreign_key "team_seasons", "seasons"
  add_foreign_key "team_seasons", "teams"
end
