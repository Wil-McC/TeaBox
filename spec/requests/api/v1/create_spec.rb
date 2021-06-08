require 'rails_helper'

RSpec.describe 'the subscription endpoint' do
  describe 'happy path' do
    before :each do
      @cust = create(:customer)
      @tea1 = create(:tea)
    end
    it 'creates an active subscription' do
      post "/api/v1/subscriptions?user_id=#{@cust.id}&tea_id=#{@tea1.id}&frequency=6"

      expect(response).to be_successful
      out = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
