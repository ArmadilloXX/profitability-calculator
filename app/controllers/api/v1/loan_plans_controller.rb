class Api::V1::LoanPlansController < Api::V1::ApiController
  def index
    @loan_plans = LoanPlan.all
    json_response @loan_plans
  end
end
