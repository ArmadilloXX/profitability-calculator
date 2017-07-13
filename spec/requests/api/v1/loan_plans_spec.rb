require 'rails_helper'
require 'helpers/request_spec_helper'
include RequestSpecHelper

RSpec.describe 'Api::V1::LoanPlans', type: :request do
  let!(:loan_plan) { create :loan_plan }

  describe 'GET /api/v1/loan_plans' do
    before { get '/api/v1/loan_plans' }

    it 'returns success status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns loan plans array' do
      expect(json).not_to be_empty
      expect(json).to be_kind_of(Array)
    end

    it 'returns correct number of loan plans' do
      expect(json.size).to eq(1)
    end
  end
end
