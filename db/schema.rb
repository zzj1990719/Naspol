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

ActiveRecord::Schema.define(version: 20140312154811) do

  create_table "pages", force: true do |t|
    t.string   "pagt_type"
    t.string   "sub_type"
    t.string   "content"
    t.string   "keyword"
    t.integer  "grade5"
    t.integer  "grade4"
    t.integer  "grade3"
    t.integer  "grade2"
    t.integer  "grade1"
    t.string   "comment"
    t.integer  "collect"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages_users", ["page_id"], name: "index_pages_users_on_page_id"
  add_index "pages_users", ["user_id", "page_id"], name: "index_pages_users_on_user_id_and_page_id", unique: true
  add_index "pages_users", ["user_id"], name: "index_pages_users_on_user_id"

  create_table "recommends", force: true do |t|
    t.integer  "websit_id"
    t.integer  "page_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommends_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "recommend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recommends_users", ["recommend_id"], name: "index_recommends_users_on_recommend_id"
  add_index "recommends_users", ["user_id", "recommend_id"], name: "index_recommends_users_on_user_id_and_recommend_id", unique: true
  add_index "recommends_users", ["user_id"], name: "index_recommends_users_on_user_id"

  create_table "relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "f_page_id"
    t.integer  "f_website_id"
    t.integer  "f_remind_id"
    t.integer  "f_recommend_id"
    t.integer  "create_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reminds", force: true do |t|
    t.string   "website"
    t.string   "url"
    t.string   "remind_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reminds_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "remind_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reminds_users", ["remind_id"], name: "index_reminds_users_on_remind_id"
  add_index "reminds_users", ["user_id", "remind_id"], name: "index_reminds_users_on_user_id_and_remind_id", unique: true
  add_index "reminds_users", ["user_id"], name: "index_reminds_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "users_websites", force: true do |t|
    t.integer  "user_id"
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_websites", ["user_id", "website_id"], name: "index_users_websites_on_user_id_and_website_id", unique: true
  add_index "users_websites", ["user_id"], name: "index_users_websites_on_user_id"
  add_index "users_websites", ["website_id"], name: "index_users_websites_on_website_id"

  create_table "websites", force: true do |t|
    t.string   "web_type"
    t.string   "sub_type"
    t.string   "name"
    t.string   "url"
    t.string   "brief"
    t.integer  "grade5"
    t.integer  "grade4"
    t.integer  "grade3"
    t.integer  "grade2"
    t.integer  "grade1"
    t.string   "comment"
    t.integer  "refer_id"
    t.integer  "collect"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
