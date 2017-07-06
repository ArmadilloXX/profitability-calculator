class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def index
    render json: Loan.all
  end

  def show; end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end
end
