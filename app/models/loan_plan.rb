class LoanPlan < ApplicationRecord
  has_many :loans
  validates :name, presence: true
  validates :basic_rate, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  attribute :basic_monthly_rate, :float
  attribute :overdue_monthly_rate, :float

  def payments_periods
    (1..duration).map { |number| "Month #{number}" }
  end

  def basic_monthly_rate
    (basic_rate / 12.0).round(8)
  end

  def overdue_monthly_rate
    (0.5 / 12.0).round(8)
  end
end
