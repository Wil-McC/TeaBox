require 'rails_helper'

RSpec.describe 'the sub index request' do
  describe 'happy path' do
    before :each do
      @cust = create(:customer)
      @tea1 = create(:tea)
      @tea2 = create(:tea)

      @sub1  = create(:subscription, status: 'active', customer_id: @cust.id, tea_id: @tea1.id)
      @sub2  = create(:subscription, status: 'inactive', customer_id: @cust.id, tea_id: @tea2.id)
    end
    it 'returns a payload with all sub info' do
      get "/api/v1/subscriptions?customer_id=#{@cust.id}"

      expect(response).to be_successful
      out = JSON.parse(response.body, symbolize_names: true)

      expect(out).to be_a(Hash)
      expect(out.keys).to eq([:data])
      expect(out[:data]).to be_an(Array)
      expect(out[:data].length).to eq(2)
      expect(out[:data].first).to be_a(Hash)
      expect(out[:data].first.keys).to eq([:id, :type, :attributes, :relationships])
    end
  end
end
