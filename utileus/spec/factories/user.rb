FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    provider "gitHub"
	uid "123"
    # professions {[FactoryGirl.create(:profession)]}
    # commented out b/c it creates a circular loop with the Profession Factory when enabled
  end
end