class AddSymbolImgUrlToLessonplans < ActiveRecord::Migration
  def change
    add_column :lessonplans, :symbol_img_url, :string

  end
end
