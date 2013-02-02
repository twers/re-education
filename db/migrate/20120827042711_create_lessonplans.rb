class CreateLessonplans < ActiveRecord::Migration
  def change
    create_table :lessonplans, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string   "title"
      t.string   "content"
      t.timestamps
    end
  end
end
