class Api::V1::ApiController < ActionController::API
  include JsonResponse
  include ExceptionsHandler
end
