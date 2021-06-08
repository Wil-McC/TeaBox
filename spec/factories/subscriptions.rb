FactoryBot.define do
  factory :subscription do
    customer_id { nil }
    tea_id { nil }
    status { "MyString" }
    frequency { 1 }
    pricepoint { 1.5 }
  end
end
