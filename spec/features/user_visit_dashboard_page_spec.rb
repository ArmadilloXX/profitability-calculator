require 'rails_helper'
require 'support/capybara'

RSpec.feature 'User visit dashboard page', type: :feature, js: true do
  let!(:borrower)   { create :borrower }
  let!(:loan_plan)  { create :loan_plan }
  let!(:loan)       { create :loan, borrower: borrower, loan_plan: loan_plan }

  context 'successfully' do
    before { visit '/dashboard' }
    it 'shows expected profitability' do
      expect(page).to have_css('h2.subtitle', text: 'Expected profitability rate')
    end
    it 'shows real profitability' do
      expect(page).to have_css('h2.subtitle', text: 'Real profitability rate')
    end
    it 'shows table of loans' do
      expect(page).to have_css('table.table')
    end
    it 'shows "Add new loan" button' do
      expect(page).to have_css('button', text: 'Add new loan')
    end
  end
end
