RSpec.shared_examples 'returns validation error' do |spec_params|
  context "when #{spec_params[:condition]}" do
    before do
      post_request_to endpoint, invalid_attributes(spec_params[:invalid_data])
    end

    it "returns #{spec_params[:message]} message" do
      expect(json['message']).to match(/#{spec_params[:message]}/)
    end
    it 'returns 422 status code' do
      expect(response).to have_http_status(422)
    end
  end
end
