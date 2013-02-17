class ChangeCommetsTableContentColumnTypeToText < ActiveRecord::Migration
  def up
  	change_column :comments, :content, :text
  end

  def down
  	change_column :comments, :content, :string
  end
end
