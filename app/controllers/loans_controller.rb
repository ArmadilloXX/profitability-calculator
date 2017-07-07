class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def index
    render json: Loan.all
  end

  def show; end

  def create
    @loan = Loan.new(loan_params)
    if @loan.save
      render json: @loan, status: :created
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:amount, :borrower_id, :loan_plan_id)
  end
end
