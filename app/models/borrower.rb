class Borrower < ApplicationRecord
  has_many :loans
  validates :name, presence: true
end
