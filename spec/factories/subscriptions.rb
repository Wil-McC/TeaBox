FactoryBot.define do
  factory :subscription do
    customer_id { nil }
    tea_id { nil }
    status { ['active', 'inactive'].sample }
    frequency { [1, 2, 3, 4, 5, 6].sample }
    pricepoint { ([1, 2, 3, 4, 5, 6].sample) * 10 }
  end
end
