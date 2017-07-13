class Payment < ApplicationRecord
  belongs_to :loan
  validates :payment_period, presence: true
  validates :amount, numericality: { greater_than: 0 }
  after_create :update_received_payments

  delegate  :monthly_basic_interests_sum,
            :monthly_overdue_interests_sum,
            to: :loan

  def interests_sum
    if overdued?
      monthly_overdue_interests_sum
    else
      monthly_basic_interests_sum
    end
  end

  def main_debt_sum
    amount - interests_sum
  end

  private

  def update_received_payments
    loan.reload.update_received_sum
  end

  def overdued?
    overdue
  end
end
