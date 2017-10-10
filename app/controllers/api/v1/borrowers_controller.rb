class Api::V1::BorrowersController < Api::V1::ApiController
  def index
    @borrowers = Borrower.all
    json_response @borrowers
  end
end
