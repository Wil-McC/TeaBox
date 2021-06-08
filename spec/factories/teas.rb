FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    temp_c { 100 }
    brew_for { ([1, 2, 3, 4].sample) * 0.5 }
  end
end
