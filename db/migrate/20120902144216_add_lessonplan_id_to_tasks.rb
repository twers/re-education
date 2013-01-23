class AddLessonplanIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :lessonplan_id, :integer
  end
end
