class AddLoanPlanToLoans < ActiveRecord::Migration[5.1]
  def change
    add_reference :loans, :loan_plan, foreign_key: true
  end
end
