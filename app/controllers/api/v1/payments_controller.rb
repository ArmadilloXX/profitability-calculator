class Api::V1::PaymentsController < Api::V1::ApiController
  before_action :set_loan

  def index
    @payments = @loan.payments
    json_response @payments
  end

  def create
    @payment = @loan.payments.create!(payment_params)
    json_response @payment, :created
  end

  private

  def set_loan
    @loan = Loan.find(params[:loan_id])
  end

  def payment_params
    params.require(:payment).permit(:amount, :payment_period, :overdue)
  end
end
