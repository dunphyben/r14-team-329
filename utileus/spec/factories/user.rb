FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    provider "gitHub"
	uid "123"
    profession_id { Faker::Number.number(1) }
  end
end