module RequestSpecHelper
  def json
    JSON.parse response.body
  end

  def post_request_to(endpoint, params = {})
    post endpoint, params: params
  end
end
