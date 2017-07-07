class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :loan_plan
  has_many :payments
  validates :amount, presence: true
end
