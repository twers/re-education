class RenamePasswordToPasswordDigestToPublishers < ActiveRecord::Migration
  def up
    rename_column :publishers, :password, :password_digest
  end

  def down
    rename_column :publishers, :password_digest, :password
  end
end
