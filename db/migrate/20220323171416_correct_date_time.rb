class CorrectDateTime < ActiveRecord::Migration[7.0]
  def change
    change_column :loans, :loan_date, :datetime
    change_column :loans, :return_date, :datetime
  end
end
