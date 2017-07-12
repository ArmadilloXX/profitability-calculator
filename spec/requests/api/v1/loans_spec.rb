require 'rails_helper'
require 'helpers/request_spec_helper'
require 'requests/shared_examples/validation_errors'
include RequestSpecHelper

RSpec.describe 'Api::V1::Loans', type: :request do
  let!(:loans) { create_list(:loan, 5) }
  let(:loan_id) { loans.first.id }

  describe 'GET /api/v1/loans' do
    before { get '/api/v1/loans' }

    it 'returns success status code' do
      expect(response).to have_http_status(200)
    end

    it 'returns loans array' do
      expect(json).not_to be_empty
      expect(json).to be_kind_of(Array)
    end

    it 'returns correct number of loans' do
      expect(json.size).to eq(5)
    end
  end

  describe 'GET /api/v1/loans/:id' do
    before { get "/api/v1/loans/#{loan_id}" }

    context 'when record exists' do
      it 'returns success status code' do
        expect(response).to have_http_status(200)
      end

      it 'returns record object' do
        expect(json).to be_kind_of(Hash)
      end

      it 'return correct loan' do
        expect(json['borrower_id']).to eq(loans.first.borrower.id)
      end
    end

    context 'when records does not exist' do
      let(:loan_id) { 200 }
      
      it 'returns 404 status code' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns not found message' do
        expect(json['message']).to match(/Couldn't find Loan with/)
      end
    end
  end

  describe 'POST /api/v1/loans' do
    let(:loan_plan) { create :loan_plan }
    let(:borrower) { create :borrower }

    context 'when request is valid' do
      before { post '/api/v1/loans', params: valid_attributes }

      it 'returns 201 status code' do
        expect(response).to have_http_status(201)
      end

      it 'creates new loan' do
        expect(json['borrower_id']).to eq(borrower.id)
        expect(json['amount']).to eq(5_000_000)
      end
    end

    context 'when request is invalid' do
      let(:endpoint) { '/api/v1/loans' }

      include_examples 'returns validation error',
                      condition: 'amount is missing',
                      message: "Amount can't be blank, Amount is not a number",
                      invalid_data: { amount: nil }

      include_examples 'returns validation error',
                      condition: 'amount is less than 0',
                      message: 'Amount must be greater than 0',
                      invalid_data: { amount: - 1000 }

      include_examples 'returns validation error',
                      condition: 'borrower is missing',
                      message: "Borrower must exist, Borrower can't be blank",
                      invalid_data: { borrower_id: nil}

      include_examples 'returns validation error',
                      condition: 'borrower is not exists',
                      message: "Borrower must exist, Borrower can't be blank",
                      invalid_data: { borrower_id: 500 }

      include_examples 'returns validation error',
                      condition: 'loan_plan is missing',
                      message: 'Loan plan must exist',
                      invalid_data: { loan_plan_id: nil}

      include_examples 'returns validation error',
                      condition: 'loan_plan is not exists',
                      message: 'Loan plan must exist',
                      invalid_data: { loan_plan_id: 500}
    end
  end

  def valid_attributes
    { 
      loan: { 
        amount: 5_000_000,
        borrower_id: borrower.id,
        loan_plan_id: loan_plan.id
      }
    }
  end

  def invalid_attributes(bad_data)
    { loan: valid_attributes[:loan].merge(bad_data) }
  end
end
