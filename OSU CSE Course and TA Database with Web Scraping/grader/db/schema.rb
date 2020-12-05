# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_26_021249) do

  create_table "course_sections", force: :cascade do |t|
    t.string "Name"
    t.string "ClassNumber"
    t.string "Component"
    t.string "Location"
    t.string "Times"
    t.string "Instructor"
    t.string "Session"
    t.string "Topic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "InstructorName"
    t.string "StudentName"
    t.integer "CourseNumber"
    t.integer "Dedication"
    t.integer "Performance"
    t.integer "Cooperation"
    t.integer "Initiative"
    t.integer "Communication"
    t.integer "Character"
    t.integer "Responsiveness"
    t.integer "Personality"
    t.integer "Appearance"
    t.integer "WorkHabit"
    t.integer "grader_application_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "grader_applications", force: :cascade do |t|
    t.string "Name"
    t.string "Email"
    t.string "GPA"
    t.string "InterestedCourses"
    t.string "AvailableTimes"
    t.string "CoursesTaken"
    t.integer "course_section_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "InstructorName"
    t.string "InstructorDepartment"
    t.integer "InstructorCourse"
    t.string "InstructorEmail"
    t.string "StudentName"
    t.string "Recommendation"
    t.integer "grader_application_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "section_grader_sets", force: :cascade do |t|
    t.integer "course_section_id"
    t.integer "CourseNumber"
    t.string "Names"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
