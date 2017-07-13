require 'rails_helper'
require 'helpers/request_spec_helper'
include RequestSpecHelper

RSpec.describe 'Api::V1::Borrowers', type: :request do
  let!(:borrowers) { create_list(:borrower, 3) }

  describe 'GET /api/v1/borrowers' do
    before { get '/api/v1/borrowers' }

    it 'returns success status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns borrowers array' do
      expect(json).not_to be_empty
      expect(json).to be_kind_of(Array)
    end

    it 'returns correct number of borrowers' do
      expect(json.size).to eq(3)
    end
  end
end
