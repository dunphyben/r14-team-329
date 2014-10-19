FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    # professions {[FactoryGirl.create(:profession)]}
    # commented out b/c it creates a circular loop with the Profession Factory when enabled
    provider "github"
	  uid "123"
    email { Faker::Internet.email }
    password { Faker::Internet.password } 
  end
end