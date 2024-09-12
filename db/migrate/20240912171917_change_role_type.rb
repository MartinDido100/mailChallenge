class ChangeRoleType < ActiveRecord::Migration[5.0]
  def change
    change_column :roles, :name, :integer, using: 'name::integer'
  end
end
