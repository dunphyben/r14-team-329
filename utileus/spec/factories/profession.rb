FactoryGirl.define do
  factory :profession do
    name { Faker::Lorem.words(2).join(" ").to_s }
    user_id { Faker::Number.number(1) }
  end
end