require 'rails_helper'

RSpec.describe LoanPlan, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :loans }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :duration }
    it { is_expected.to validate_presence_of :basic_rate }
    it { is_expected.to validate_numericality_of :basic_rate }
    it { is_expected.to validate_numericality_of :duration }
  end

  describe '#basic_monthly_rate' do
    it 'should return correct number' do
      loan_plan = create :loan_plan
      expect(loan_plan.basic_monthly_rate).to eq(0.025)
    end
  end

  describe '#overdue_monthly_rate' do
    it 'should return correct number' do
      loan_plan = create :loan_plan
      expect(loan_plan.overdue_monthly_rate).to eq(0.04166667)
    end
  end
end
