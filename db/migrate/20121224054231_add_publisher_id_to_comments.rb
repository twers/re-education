class AddPublisherIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :publisher_id, :integer
  end
end
