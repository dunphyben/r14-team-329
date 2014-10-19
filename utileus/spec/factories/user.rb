FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    provider "github"
	  uid "123"
    # profession_id { Faker::Number.number(1) }
    email { Faker::Internet.email }
    password { Faker::Internet.password } 
  end
end