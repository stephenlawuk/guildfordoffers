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

ActiveRecord::Schema.define(:version => 20110321234536) do

  create_table "posts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "offer"
    t.text     "description"
    t.date     "validto"
    t.text     "validtonotes"
    t.string   "company"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.text     "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "openingtimes"
    t.text     "metadata"
    t.string   "imgurl"
    t.string   "web"
    t.string   "nus"
  end

end