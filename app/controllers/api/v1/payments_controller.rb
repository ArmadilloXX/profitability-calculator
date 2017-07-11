class Api::V1::PaymentsController < Api::V1::ApiController
  before_action :set_loan

  def index
    render json: @loan.payments
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end
end
