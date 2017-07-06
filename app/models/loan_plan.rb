class LoanPlan < ApplicationRecord
  has_many :loans
  validates :name, presence: true
  validates :basic_rate, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
end
