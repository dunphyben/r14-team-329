FactoryGirl.define do
  factory :profession do
    name { Faker::Lorem.words(2).join(" ").to_s }
    users {[FactoryGirl.create(:user)]}
  end
end