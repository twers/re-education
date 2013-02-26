class ConvertCommentableTypeLengthLonger < ActiveRecord::Migration
  def up
    change_column :comments, :commentable_type, :string, :limit => 20
  end

  def down
    change_column :comments, :commentable_type, :string, :limit => 16
  end
end
