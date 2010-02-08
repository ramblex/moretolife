# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100208165242) do

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "event_links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "date_begin"
    t.datetime "date_end"
    t.string   "venue"
    t.text     "short_desc"
    t.text     "long_desc"
    t.string   "speaker"
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "area_id"
    t.string   "image"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "mid_col"
    t.text     "right_col"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.string   "file_file_size"
  end

end
