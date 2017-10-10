class ChangePaymentPeriodInPayments < ActiveRecord::Migration[5.1]
  def change
    change_column :payments,
                  :payment_period,
                  'integer USING CAST(payment_period AS integer)'
  end
end
