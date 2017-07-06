require 'rails_helper'

RSpec.feature 'User visit loan details page', type: :feature do
  let(:borrower)   { create :borrower }
  let(:loan_plan)  { create :loan_plan }
  let(:loan)       { create :loan, borrower: borrower, loan_plan: loan_plan}

  before { visit loan_path(loan) }

  it 'shows loan id header' do
    expect(page).to have_css('h1', text: "LOAN ##{loan.id}")
  end
end
