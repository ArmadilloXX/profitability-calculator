class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :loan_plan
  has_many :payments, dependent: :destroy
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  delegate :payments_periods, to: :loan_plan

  def upcoming_payment_periods
    (payments_periods - closed_payment_periods).map { |name| name }
  end

  def closed_payment_periods
    payments.map(&:payment_period)
  end
end
