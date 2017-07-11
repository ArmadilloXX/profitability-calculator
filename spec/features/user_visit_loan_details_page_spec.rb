require 'rails_helper'
require 'support/capybara'

RSpec.feature 'User visit loan details page', type: :feature do
  let!(:borrower)   { create :borrower }
  let!(:loan_plan)  { create :loan_plan }
  let(:loan)       { create :loan, borrower: borrower, loan_plan: loan_plan }

  before { visit "/loans/#{loan.id}" }

  it "shows loan's borrower name" do
    expect(page).to have_css('h1', text: borrower.name)
  end
  it "shows loan's amount" do
    expect(page).to have_css('h2', text: loan.amount)
  end
  it "shows loan's loan plan name" do
    expect(page).to have_css('h2', text: loan_plan.name)
  end
  it "shows loan's payments table", js: true do
    expect(page).to have_css('table.table')
  end
end
