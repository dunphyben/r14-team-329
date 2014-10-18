FactoryGirl.define do
  factory :list do
    name { Faker::Lorem.words(4).join(" ").to_s }
    overview { Faker::Lorem.sentence(10) }
    user_id { Faker::Number.number(1) }
  end
end
