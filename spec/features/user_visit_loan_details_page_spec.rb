require 'rails_helper'
require 'support/capybara'

RSpec.feature 'User visit loan details page', type: :feature, js: true do
  let!(:borrower) { create :borrower }
  let!(:loan_plan) { create :loan_plan }
  let(:loan) { create :loan, borrower: borrower, loan_plan: loan_plan }

  before { visit "/loans/#{loan.id}" }

  it "shows loan's borrower name" do
    expect(page).to have_css('h2.title', text: borrower.id)
  end
  it "shows loan's amount" do
    expect(page).to have_css('h2.title', text: '1000000.00')
  end
  it "shows loan's loan plan name" do
    expect(page).to have_css('h2.title', text: loan_plan.id)
  end
  it "shows loan's payments table" do
    expect(page).to have_css('table.table')
  end
end
