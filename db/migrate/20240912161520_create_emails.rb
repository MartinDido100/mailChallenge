class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails, id: :uuid do |t|
      t.string :subject
      t.text :body
      t.references :senderId, foreign_key: {to_table: :users}, type: :uuid
      t.references :receiverId, foreign_key: {to_table: :users}, type: :uuid

      t.timestamps
    end
  end
end
