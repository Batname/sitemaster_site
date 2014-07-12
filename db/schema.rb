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

ActiveRecord::Schema.define(version: 20150714205355) do

  create_table "article_translations", force: true do |t|
    t.integer  "article_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text"
    t.text     "short_description"
  end

  add_index "article_translations", ["article_id"], name: "index_article_translations_on_article_id"
  add_index "article_translations", ["locale"], name: "index_article_translations_on_locale"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "image"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "contact_forms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "massage"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_translations", force: true do |t|
    t.integer  "project_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text"
    t.text     "short_description"
  end

  add_index "project_translations", ["locale"], name: "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], name: "index_project_translations_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "image"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.string   "link"
  end

  create_table "service_translations", force: true do |t|
    t.integer  "service_id",        null: false
    t.string   "locale",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "text"
    t.text     "short_description"
  end

  add_index "service_translations", ["locale"], name: "index_service_translations_on_locale"
  add_index "service_translations", ["service_id"], name: "index_service_translations_on_service_id"

  create_table "services", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "image"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.string   "icon"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "works", force: true do |t|
    t.integer  "service_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["project_id"], name: "index_works_on_project_id"
  add_index "works", ["service_id"], name: "index_works_on_service_id"

end
