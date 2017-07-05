require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :borrower }
    it { is_expected.to have_many :payments }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :amount }
  end
end
