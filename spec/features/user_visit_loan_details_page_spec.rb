require 'rails_helper'

RSpec.feature 'User visit loan details page', type: :feature do
  let(:borrower)   { create :borrower }
  let(:loan_plan)  { create :loan_plan }
  let(:loan)       { create :loan, borrower: borrower, loan_plan: loan_plan }

  before { visit loan_path(loan) }

  it 'shows proper header' do
    expect(page).to have_css('h1', text: 'LOAN DETAILS')
  end
  it "shows loan's borrower name" do
    expect(page).to have_css('h2', text: borrower.name)
  end
  it "shows loan's amount" do
    expect(page).to have_css('h2', text: loan.amount)
  end
  it "shows loan's loan plan name" do
    expect(page).to have_css('h2', text: loan_plan.name)
  end
end
