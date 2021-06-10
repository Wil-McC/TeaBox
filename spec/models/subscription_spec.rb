require 'rails_helper'

RSpec.describe Subscription, type: :model do
  # describe 'validations' do
    # it { should validate_presence_of  }
  # end
  describe 'relationships' do
    it { should have_many :tea_subscriptions }
    it { should have_many(:teas).through(:tea_subscriptions) }
  end
end
