class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :avatar
      t.string :email
      t.string :alternative_name
      t.text :short_description
      t.timestamps
    end
  end
end
