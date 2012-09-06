class AddShortDescriptionToLessonplans < ActiveRecord::Migration
  def change
    add_column :lessonplans, :short_description, :string
  end
end
