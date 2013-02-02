class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string "title"
      t.string "content"  
      t.timestamps
    end
  end
end
