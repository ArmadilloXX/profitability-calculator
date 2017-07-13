require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :borrower }
    it { is_expected.to have_many(:payments).dependent(:destroy) }
    it { is_expected.to belong_to :loan_plan }
    it { is_expected.to have_attributes(received_sum: 0.0) }
    it { is_expected.to have_attributes(expected_sum: 0.0) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :borrower }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  end

  describe '#received sum' do
  end
  describe '#received_main_debt_sum' do
  end
  describe '#received_interests_sum' do
  end
  describe '#expected sum' do
  end
  describe '#current_profitability_rate' do
  end
end
