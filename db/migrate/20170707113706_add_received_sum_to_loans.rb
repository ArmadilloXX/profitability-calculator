class AddReceivedSumToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :received_sum, :float
  end
end
