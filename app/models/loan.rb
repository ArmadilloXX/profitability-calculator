class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :loan_plan
  has_many :payments, dependent: :destroy
  validates :amount, presence: true
  validates :borrower, presence: true
  validates :amount, numericality: { greater_than: 0 }
  attribute :received_sum, :float, default: 0.0
  attribute :expected_sum, :float, default: 0.0
  attribute :received_interests_sum, :float
  attribute :upcoming_payment_periods
  attribute :current_profitability_rate, :float
  attribute :borrower_name
  attribute :loan_plan_name
  after_create :set_expected_sum

  default_scope -> { includes(:payments) }

  delegate :name, to: :loan, prefix: true
  delegate :name, to: :borrower, prefix: true

  delegate  :duration,
            :payments_periods,
            :basic_rate,
            :basic_monthly_rate,
            :overdue_monthly_rate,
            to: :loan_plan

  def upcoming_payment_periods
    (payments_periods - closed_payment_periods).map { |period| period }.sort
  end

  def monthly_basic_interests_sum
    (amount * basic_monthly_rate).round(2)
  end

  def monthly_overdue_interests_sum
    (amount * overdue_monthly_rate).round(2)
  end

  def monthly_main_debt_coverage_sum
    (amount / duration).to_f.round(2)
  end

  def update_received_sum
    update_attributes(
      received_sum: payments.map(&:amount).reduce(:+).to_f.round(2)
    )
  end

  def current_profitability_rate
    if payments.empty?
      0
    else
      (received_interests_sum / received_main_debt_sum * 12.0 / duration)
        .round(4)
    end
  end

  def received_main_debt_sum
    payments.map(&:main_debt_sum).reduce(0, :+)
  end

  def received_interests_sum
    payments.map(&:interests_sum).reduce(0, :+)
  end

  private

  def closed_payment_periods
    payments.map(&:payment_period)
  end

  def set_expected_sum
    update_attributes(expected_sum: amount + interests_sum)
  end

  def interests_sum
    amount * (duration / 12.0 * basic_rate).to_f
  end
end
