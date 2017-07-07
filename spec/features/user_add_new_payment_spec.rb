require 'rails_helper'
require 'support/capybara'

RSpec.feature 'User add new payment', type: :feature, js: true do
  let!(:borrower)   { create :borrower }
  let!(:loan_plan)  { create :loan_plan }
  let!(:loan)       { create :loan, loan_plan: loan_plan, borrower: borrower }

  def fill_and_submit_new_payment_form
    visit loan_path(loan)
    click_on 'Add new payment'
    fill_in 'payment[amount]', with: 191_666.67
    click_on 'Save'
  end

  context 'with correct data' do
    before do
      fill_and_submit_new_payment_form
    end

    it 'shows newly created payment amount in payments table' do
      expect(page).to have_content(191_666.67)
    end
  end
end
