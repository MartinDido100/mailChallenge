class EmailColumnsRename < ActiveRecord::Migration[5.0]
  def change
    rename_column :emails, :senderId_id, :senderId
    rename_column :emails, :receiverId_id, :receiverId
  end
end
