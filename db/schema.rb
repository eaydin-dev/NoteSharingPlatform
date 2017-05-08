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

ActiveRecord::Schema.define(version: 20170508080914) do

  create_table "boughts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "material_id"
    t.index ["material_id"], name: "index_boughts_on_material_id", using: :btree
    t.index ["user_id"], name: "index_boughts_on_user_id", using: :btree
  end

  create_table "material_reputations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "material_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["material_id"], name: "fk_rails_0d40b30b9d", using: :btree
    t.index ["user_id"], name: "fk_rails_cadfeb5afa", using: :btree
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "description",       limit: 65535
    t.text     "source",            limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "title"
    t.integer  "price"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "user_id"
    t.integer  "reputation",                      default: 0
    t.index ["user_id"], name: "index_materials_on_user_id", using: :btree
  end

  create_table "user_reputations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_give"
    t.integer  "user_recieve"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_give"], name: "fk_rails_1365d6e9f8", using: :btree
    t.index ["user_recieve"], name: "fk_rails_6cfe044377", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "surname"
    t.string   "school"
    t.string   "department"
    t.integer  "budget"
    t.integer  "reputation"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "boughts", "materials"
  add_foreign_key "boughts", "users"
  add_foreign_key "material_reputations", "materials"
  add_foreign_key "material_reputations", "users"
  add_foreign_key "materials", "users"
  add_foreign_key "user_reputations", "users", column: "user_give"
  add_foreign_key "user_reputations", "users", column: "user_recieve"
end
