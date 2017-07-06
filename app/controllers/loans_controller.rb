class LoansController < ApplicationController
  before_action :set_loan, only: [:show]

  def show; end
  
  private
  def set_loan
    @loan = Loan.find(params[:id])
  end
end
