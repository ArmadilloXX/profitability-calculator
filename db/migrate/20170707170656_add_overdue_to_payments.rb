class AddOverdueToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :overdue, :boolean
  end
end
