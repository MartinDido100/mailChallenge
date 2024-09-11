class CreateMails < ActiveRecord::Migration[5.0]
  def change
    create_table :mails, id: :uuid do |t|
      t.string :subject
      t.references :sender, foreign_key: { to_table: :users }, type: :uuid
      t.references :receiver, foreign_key: { to_table: :users }, type: :uuid
      t.text :body

      t.timestamps
    end
  end
end
