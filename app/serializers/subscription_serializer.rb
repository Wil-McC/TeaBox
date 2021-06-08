class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :subscription
  attributes :status, :frequency, :pricepoint
  belongs_to :customer
  belongs_to :tea
end
