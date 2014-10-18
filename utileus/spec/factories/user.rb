FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    profession_id { Faker::Number.number(1) }
  end
end