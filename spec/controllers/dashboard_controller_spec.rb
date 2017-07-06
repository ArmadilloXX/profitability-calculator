require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'returns 200 status code' do
      expect(response).to have_http_status(:success)
    end
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }
  end
end
