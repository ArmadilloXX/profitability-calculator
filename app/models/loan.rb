class Loan < ApplicationRecord
  belongs_to :borrower
  validates :amount, presence: true
end
