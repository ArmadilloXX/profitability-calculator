require 'rails_helper'
require 'helpers/request_spec_helper'
require 'requests/shared_examples/validation_errors'
include RequestSpecHelper

RSpec.describe 'Api::V1::Payments', type: :request do
  let!(:loan) { create :loan }
  let!(:payments) { create_list(:payment, 4, loan: loan) }

  describe 'GET /api/v1/loans/:id/payments' do
    before { get "/api/v1/loans/#{loan.id}/payments" }

    it 'returns success status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns loans array' do
      expect(json).not_to be_empty
      expect(json).to be_kind_of(Array)
    end

    it 'returns correct number of payments' do
      expect(json.size).to eq(4)
    end
  end

  describe 'POST /api/v1/loans/:id/payments' do
    context 'when request is valid' do
      before do
        post "/api/v1/loans/#{loan.id}/payments", params: valid_attributes
      end

      it 'returns 201 status code' do
        expect(response).to have_http_status(201)
      end

      it 'creates new payment' do
        expect(json['loan_id']).to eq(loan.id)
        expect(json['amount']).to eq(200000)
      end
    end

    context 'when request is invalid' do
      let(:endpoint) { "/api/v1/loans/#{loan.id}/payments" }

      include_examples 'returns validation error',
                      condition: 'amount is missing',
                      message: "Amount is not a number",
                      invalid_data: { amount: nil }

      include_examples 'returns validation error',
                      condition: 'amount is less than 0',
                      message: 'Amount must be greater than 0',
                      invalid_data: { amount: -1000 }

      include_examples 'returns validation error',
                      condition: 'payment_perion is missing',
                      message: "Payment period can't be blank",
                      invalid_data: { payment_period: nil}
    end
  end

  def valid_attributes
    { 
      payment: { 
        amount: 200_000,
        payment_period: 'Month 1',
        overdue: false
      },
    }
  end

  def invalid_attributes(bad_data)
    {
      payment: valid_attributes[:payment].merge(bad_data),
    }
  end
end
