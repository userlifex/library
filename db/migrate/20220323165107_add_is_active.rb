class AddIsActive < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :is_active, :boolean, default: true
    add_column :books, :release_date, :date 
    add_column :users, :is_active, :boolean, default: true
    add_column :loans, :is_active, :boolean, default: true
    remove_column :books, :price, :integer
    remove_column :users, :is_admin, :boolean
    remove_column :books, :code, :string
  end
end
