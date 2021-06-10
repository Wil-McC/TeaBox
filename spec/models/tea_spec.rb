require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :temp_c }
    it { should validate_presence_of :brew_for }
    it { should validate_presence_of :tier }
  end
  describe 'relationships' do
    it { should have_many :tea_subscriptions }
    it { should have_many(:subscriptions).through(:tea_subscriptions) }
  end
end
