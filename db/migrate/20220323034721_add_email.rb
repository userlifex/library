class AddEmail < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    remove_column :users, :code, :string
  end
end
