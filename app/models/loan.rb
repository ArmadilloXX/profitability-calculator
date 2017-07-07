class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :loan_plan
  has_many :payments, dependent: :destroy
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
