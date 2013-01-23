class AddUserIdToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :user_id, :integer
  end
end
