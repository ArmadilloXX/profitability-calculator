class AddPaymentPeriodToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :payment_period, :string
  end
end
