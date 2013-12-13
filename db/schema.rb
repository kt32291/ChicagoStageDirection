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

ActiveRecord::Schema.define(version: 20131212202236) do

  create_table "actors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "equity"
    t.integer  "height"
    t.integer  "weight"
    t.string   "headshot"
    t.string   "resume"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "hair"
    t.string   "eyes"
  end

  create_table "associates", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.integer  "company_id"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auditions", force: true do |t|
    t.string   "name"
    t.date     "post_date"
    t.string   "audition_date"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "phone"
    t.string   "email"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "associate_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.integer  "actor_id"
    t.integer  "audition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
