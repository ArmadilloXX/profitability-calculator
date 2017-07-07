require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :loan }
    it { is_expected.to have_attribute :payment_period }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :payment_period }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0) }
  end
end
