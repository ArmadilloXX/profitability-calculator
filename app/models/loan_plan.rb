class LoanPlan < ApplicationRecord
  has_many :loans
  validates :name, presence: true
  validates :basic_rate, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  attribute :basic_monthly_rate, :float
  attribute :overdue_monthly_rate, :float

  def payments_periods
    Set.new(1..duration)
  end

  def basic_monthly_rate
    (basic_rate / 12.0).round(8)
  end

  def overdue_monthly_rate
    (0.5 / 12.0).round(8)
  end
end
