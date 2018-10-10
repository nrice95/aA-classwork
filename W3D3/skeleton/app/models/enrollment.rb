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

class Enrollment < ApplicationRecord

  belongs_to :course,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Course

  belongs_to :user,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: :User

end
