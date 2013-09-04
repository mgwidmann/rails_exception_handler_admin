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

ActiveRecord::Schema.define(:version => 20130904021511) do

  create_table "error_messages", :force => true do |t|
    t.string "class_name"
    t.string "message"
    t.string "trace"
    t.string "params"
    t.string "target_url"
    t.string "referer_url"
    t.string "user_agent"
    t.string "user_info"
    t.string "app_name"
    t.string "doc_root"
    t.date   "created_at",  :null => false
    t.date   "updated_at",  :null => false
  end

end
