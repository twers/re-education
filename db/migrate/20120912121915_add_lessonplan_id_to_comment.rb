class AddLessonplanIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :lessonplan_id, :integer

  end
end
