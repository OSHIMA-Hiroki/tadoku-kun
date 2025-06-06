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

ActiveRecord::Schema[7.1].define(version: 2025_06_06_155638) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "yomiyasusa_level"
    t.string "word_count"
    t.string "isbn"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "yl_min", precision: 3, scale: 1
    t.decimal "yl_max", precision: 3, scale: 1
    t.integer "word_count_min"
    t.integer "word_count_max"
    t.integer "word_count_avg"
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
    t.index ["title"], name: "index_books_on_title"
    t.index ["word_count"], name: "index_books_on_word_count"
    t.index ["yomiyasusa_level"], name: "index_books_on_yomiyasusa_level"
  end

  create_table "reading_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "read_at", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reading_logs_on_book_id"
    t.index ["read_at"], name: "index_reading_logs_on_read_at"
    t.index ["user_id", "book_id"], name: "index_reading_logs_on_user_and_book"
    t.index ["user_id"], name: "index_reading_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reading_logs", "books"
  add_foreign_key "reading_logs", "users"
end
