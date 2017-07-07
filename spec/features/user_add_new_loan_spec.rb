require 'rails_helper'
require 'support/capybara'

RSpec.feature 'User visit dashboard page', type: :feature, js: true do
  let!(:borrower)   { create :borrower }
  let!(:loan_plan)  { create :loan_plan }

  def fill_and_submit_new_loan_form
    visit dashboard_path
    click_on 'Add new loan'
    fill_in 'loan[amount]', with: 500_000
    select loan_plan.name,  from: 'loan[loan_plan_id]'
    select borrower.name,   from: 'loan[borrower_id]'
    click_on 'Save'
  end

  context 'with correct data' do
    before do
      fill_and_submit_new_loan_form
    end

    it 'shows newly created loan in loans table' do
      expect(page).to have_content(500_000)
    end
  end
end
