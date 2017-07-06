require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  let(:borrower)   { create :borrower }
  let(:loan_plan)  { create :loan_plan }
  let(:loan)       { create :loan, borrower: borrower, loan_plan: loan_plan}

  describe 'GET #show' do
    before { get :show, params: { id: loan.id } }

    it 'returns 200 status code' do
      expect(response).to have_http_status(:success)
    end
    it 'correctly assigns loan instance variable' do
      expect(assigns :loan).to eq(loan)
    end
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :show }
  end
end
