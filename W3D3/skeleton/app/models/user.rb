# create_table "courses", force: :cascade do |t|
#   t.string "name"
#   t.integer "prereq_id"
#   t.integer "instructor_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "enrollments", force: :cascade do |t|
#   t.integer "course_id"
#   t.integer "student_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "users", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class User < ApplicationRecord

  has_many :enrollments,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
end
