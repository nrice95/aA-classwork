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

class Course < ApplicationRecord
  has_many :enrollments,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user

  belongs_to :prerequisite,
    foreign_key: :prereq_id,
    primary_key: :id,
    class_name: :Course

  belongs_to :instructor,
      foreign_key: :instructor_id,
      primary_key: :id,
      class_name: :User
end
