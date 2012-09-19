class AddNickNameAndAvatarUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nick_name, :string

    add_column :users, :avatar_url, :string

  end
end
