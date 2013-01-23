class AddPublisherIdToLessonplan < ActiveRecord::Migration
  def change
    add_column :lessonplans, :publisher_id, :integer
  end
end
