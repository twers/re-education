class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string "title"
      t.string "content"	
      t.datetime "created_at",     :null => false
      t.datetime "updated_at",     :null => false
    end
  end
end
