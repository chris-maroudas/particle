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

ActiveRecord::Schema.define(:version => 20140828005009) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.boolean  "published",    :default => false
    t.integer  "user_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "featured",     :default => false
    t.datetime "published_at"
    t.boolean  "commentable",  :default => false
    t.string   "preview"
    t.string   "image"
    t.boolean  "rateable",     :default => false
  end

  add_index "articles", ["slug"], :name => "index_articles_on_slug"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "articles_categories", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  add_index "articles_categories", ["article_id", "category_id"], :name => "index_articles_categories_on_article_id_and_category_id"

  create_table "assetable_assets", :force => true do |t|
    t.integer  "assetable_id"
    t.integer  "asset_id"
    t.string   "assetable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "assetable_assets", ["assetable_id", "asset_id"], :name => "index_assetable_assets_on_assetable_id_and_asset_id"

  create_table "assets", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  create_table "banner_images", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "banner_id"
    t.string   "title"
    t.string   "caption"
  end

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug"

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

  create_table "contact_pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "media_galleries", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "node_types", :force => true do |t|
    t.string   "name"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nodes", :force => true do |t|
    t.integer  "menu_id"
    t.integer  "node_type_id"
    t.integer  "position"
    t.string   "name"
    t.string   "optional_field"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "nodes", ["menu_id", "node_type_id"], :name => "index_nodes_on_menu_id_and_node_type_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "ratings", :force => true do |t|
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "article_id"
  end

  add_index "ratings", ["article_id", "user_id"], :name => "index_ratings_on_article_id_and_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "static_pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "is_gallery"
  end

  add_index "static_pages", ["slug"], :name => "index_static_pages_on_slug"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "role_id"
    t.string   "bio"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
