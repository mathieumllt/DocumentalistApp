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

ActiveRecord::Schema.define(version: 2019_02_28_150200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "import_errors", force: :cascade do |t|
    t.string "error_name", null: false
    t.string "line", null: false
    t.string "error_type", null: false
    t.string "data_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_templates", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_skill_templates_on_skill_id"
    t.index ["template_id"], name: "index_skill_templates_on_template_id"
  end

  create_table "skill_worksessions", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "worksession_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_skill_worksessions_on_skill_id"
    t.index ["worksession_id"], name: "index_skill_worksessions_on_worksession_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_worksessions", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "worksession_id"
    t.boolean "presence", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_worksessions_on_student_id"
    t.index ["worksession_id"], name: "index_student_worksessions_on_worksession_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worksessions", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.date "date", null: false
    t.string "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "skill_templates", "skills"
  add_foreign_key "skill_templates", "templates"
  add_foreign_key "skill_worksessions", "skills"
  add_foreign_key "skill_worksessions", "worksessions"
  add_foreign_key "student_worksessions", "students"
  add_foreign_key "student_worksessions", "worksessions"
end
