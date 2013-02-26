class ChangeCommentToAPolymorphicModle < ActiveRecord::Migration
  def up
    remove_column :comments, :lessonplan_id
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string, limit: 16
  end

  def down
    add_column :comments, :lessonplan_id, :integer
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end
