class Api::V1::LoansController < Api::V1::ApiController
  before_action :set_loan, only: [:show]

  def index
    json_response Loan.all
  end

  def show
    json_response @loan
  end

  def create
    @loan = Loan.create!(loan_params)
    json_response @loan, :created
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:amount, :borrower_id, :loan_plan_id)
  end
end
