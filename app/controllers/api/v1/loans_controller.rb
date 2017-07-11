class Api::V1::LoansController < Api::V1::ApiController
  before_action :set_loan, only: [:show]

  def index
    render json: Loan.all
  end

  def show
    render json: @loan
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end
end
