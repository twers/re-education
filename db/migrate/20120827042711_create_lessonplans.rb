class CreateLessonplans < ActiveRecord::Migration
  def change
    create_table :lessonplans do |t|
      t.string   "title"
      t.integer  "student_count"
      t.string   "content"
      t.timestamps
    end
  end
end
