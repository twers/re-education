class ChangeDataTypeForLessonplanContent < ActiveRecord::Migration
  def up
    change_table :lessonplans do |t|
      t.change :content, :text
    end
  end

  def down
    change_table :lessonplans do |t|
      t.change :content, :string
    end
  end
end
