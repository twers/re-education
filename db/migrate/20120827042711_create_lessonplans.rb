class CreateLessonplans < ActiveRecord::Migration
  def change
    create_table :lessonplans do |t|
      t.string   "title"
      t.integer  "student_count"
      t.string   "content"
      t.datetime "created_at",     :null => false
      t.datetime "updated_at",     :null => false
    end
  end
end
