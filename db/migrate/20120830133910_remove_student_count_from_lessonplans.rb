class RemoveStudentCountFromLessonplans < ActiveRecord::Migration
  def up
  	remove_column :Lessonplans, :student_count
  end

  def down
  	add_column :Lessonplans, :student_count, :string
  end
end
