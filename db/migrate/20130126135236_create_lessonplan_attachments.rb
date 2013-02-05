class CreateLessonplanAttachments < ActiveRecord::Migration
  def change
    create_table :lessonplan_attachments do |t|
      t.string :name
      t.string :attachment
      t.integer :lessonplan_id
      t.timestamps
    end
  end
end
