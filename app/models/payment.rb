class Payment < ApplicationRecord
  belongs_to :loan
  validates :payment_period, presence: true
end
