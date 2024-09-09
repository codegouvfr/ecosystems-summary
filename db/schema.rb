# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_09_135241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.integer "projects_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "url"
    t.json "repository"
    t.json "packages"
    t.json "commits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "dependent_repos"
    t.integer "collection_id"
    t.json "events"
    t.string "keywords", default: [], array: true
    t.json "dependencies"
    t.datetime "last_synced_at"
    t.json "issues"
    t.float "score", default: 0.0
    t.json "owner"
    t.text "codemeta_file"
    t.text "publiccode_file"
    t.index ["collection_id"], name: "index_projects_on_collection_id"
  end
end
