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
end
