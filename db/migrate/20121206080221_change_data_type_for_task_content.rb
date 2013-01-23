class ChangeDataTypeForTaskContent < ActiveRecord::Migration
  def up
    change_table :tasks do |t|
      t.change :content, :text
    end
  end

  def down
    change_table :tasks do |t|
      t.change :content, :string
    end
  end
end
