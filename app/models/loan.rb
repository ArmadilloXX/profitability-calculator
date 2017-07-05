class Loan < ApplicationRecord
  belongs_to :borrower
  has_many :payments
  validates :amount, presence: true
end
