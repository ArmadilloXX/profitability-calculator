class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :loan_plan
  has_many :payments
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than: 0
end
