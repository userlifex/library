class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :code
      t.string :title
      t.string :author
      t.integer :quantity
      t.integer :total_available

      t.timestamps
    end
  end
end
