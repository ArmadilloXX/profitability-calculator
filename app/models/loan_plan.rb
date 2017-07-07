class LoanPlan < ApplicationRecord
  has_many :loans
  validates :name, presence: true
  validates :basic_rate, presence: true, numericality: true
  validates :duration, presence: true, numericality: true

  def payments_periods
    (1..duration).map { |number| "Month #{number}" }
  end
end
