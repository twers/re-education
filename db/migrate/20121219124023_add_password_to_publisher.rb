class AddPasswordToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :password, :string
  end
end
