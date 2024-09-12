class AddConfirmTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirm_email_token, :string
  end
end
