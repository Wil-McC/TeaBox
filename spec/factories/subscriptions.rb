FactoryBot.define do
  factory :subscription do
    customer_id { nil }
    tea_id { nil }
    status { ['active', 'inactive'].sample }
    frequency { [1..12].sample }
    pricepoint { ([1, 2, 3, 5, 6].sample) * 10 }
  end
end
