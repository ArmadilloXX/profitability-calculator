class AddExpectedSumToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :expected_sum, :float
  end
end
