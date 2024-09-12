class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_column :users, :role_id, :uuid, foreign_key: {to_table: :roles}
  end
end
