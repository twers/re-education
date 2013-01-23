class AddUserIdToLessonplans < ActiveRecord::Migration
  def change
    add_column :lessonplans, :user_id, :integer
  end
end
