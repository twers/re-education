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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130218072047) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "lessonplan_id"
    t.integer  "publisher_id"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "email"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessonplan_attachments", :force => true do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "lessonplan_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "lessonplans", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "short_description"
    t.string   "symbol_img_url"
    t.string   "attachment"
    t.integer  "user_id"
    t.integer  "publisher_id"
  end

  create_table "publishers", :force => true do |t|
    t.string   "avatar"
    t.string   "email"
    t.string   "alternative_name"
    t.text     "short_description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
    t.string   "password_digest"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "lessonplan_id"
  end

  create_table "users", :force => true do |t|
    t.string "access_token"
    t.string "unique_id"
    t.string "nick_name"
    t.string "avatar_url"
  end

end
