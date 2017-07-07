class PaymentsController < ApplicationController
  before_action :set_loan

  def index
    render json: @loan.payments
  end

  def create
    @payment = @loan.payments.new(payment_params)
    if @loan.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end

  def payment_params
    params.require(:payment).permit(:amount, :payment_period, :overdue)
  end
end
