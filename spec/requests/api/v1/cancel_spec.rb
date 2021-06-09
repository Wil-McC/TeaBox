require 'rails_helper'

RSpec.describe 'the cancel sub request' do
  describe 'happy path' do
    before :each do
      @cust = create(:customer)
      @tea1 = create(:tea)

      @sub  = create(:subscription, status: 'active', customer_id: @cust.id, tea_id: @tea1.id)
    end
    it 'updates status to inactive' do
      expect(@sub.status).to eq('active')

      patch "/api/v1/subscriptions/#{@sub.id}"

      expect(response).to be_successful
      out = JSON.parse(response.body, symbolize_names: true)

      expect(out).to be_a(Hash)
      expect(out.keys).to eq([:data])
      expect(out[:data].keys).to eq([:id, :type, :attributes, :relationships])
      expect(out[:data][:attributes].keys).to eq([:status, :frequency, :pricepoint])
      expect(out[:data][:attributes][:status]).to eq('inactive')
    end
  end
end
