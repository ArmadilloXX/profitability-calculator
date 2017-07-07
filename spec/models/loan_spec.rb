require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :borrower }
    it { is_expected.to have_many :payments }
    it { is_expected.to belong_to :loan_plan }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0)}
  end
end
