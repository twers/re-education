class CreateAttachmentComments < ActiveRecord::Migration
  def change
    create_table :attachment_comments do |t|
      t.string :content
      t.integer :publisher_id
      t.integer :lessonplan_attachment_id
      t.timestamps
    end
  end
end
