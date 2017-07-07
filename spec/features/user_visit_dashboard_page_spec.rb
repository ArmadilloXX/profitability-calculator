require 'rails_helper'
require 'support/capybara'

RSpec.feature 'User visit dashboard page', type: :feature do
  let!(:borrower)   { create :borrower }
  let!(:loan_plan)  { create :loan_plan }
  let!(:loan)       { create :loan, borrower: borrower, loan_plan: loan_plan }

  context 'successfully' do
    before { visit dashboard_path }
    it 'shows expected profitability' do
      expect(page).to have_css('h2', text: 'Expected profitability rate')
    end
    it 'shows real profitability' do
      expect(page).to have_css('h2', text: 'Real profitability rate')
    end
    it 'shows table of loans', js: true do
      expect(page).to have_css('table.table')
    end
    it 'shows "Add new loan" button', js: true do
      expect(page).to have_css('button', text: 'Add new loan')
    end
  end
end
