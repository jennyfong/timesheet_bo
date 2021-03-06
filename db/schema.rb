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

ActiveRecord::Schema.define(:version => 20130227132300) do

  create_table "bill_dates", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.boolean  "is_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_logs", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "bill_date_id"
    t.string   "title"
    t.string   "description"
    t.string   "reference_id"
    t.integer  "duration"
    t.integer  "position"
    t.boolean  "is_break",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_favourite"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "identifier_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["identifier_url"], :name => "index_users_on_identifier_url"

end
