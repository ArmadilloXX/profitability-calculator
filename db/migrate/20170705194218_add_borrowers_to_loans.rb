class AddBorrowersToLoans < ActiveRecord::Migration[5.1]
  def change
    add_reference :loans, :borrower, foreign_key: true
  end
end
