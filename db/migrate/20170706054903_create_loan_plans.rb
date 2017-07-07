class CreateLoanPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_plans do |t|
      t.string :name
      t.float :basic_rate
      t.integer :duration
    end
  end
end
