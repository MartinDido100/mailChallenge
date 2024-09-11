class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email, null: false, unique: true
      t.string :password_digest
      t.string :username, null: false, unique: true

      t.timestamps
    end
  end
end
