class AddAttachmentToLessonplans < ActiveRecord::Migration
  def change
    add_column :lessonplans, :attachment, :string
  end
end
