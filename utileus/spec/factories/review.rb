FactoryGirl.define do
  factory :review do
    quick_review { Faker::Lorem.paragraph(1) }
    full_review { Faker::Lorem.paragraphs(4).join(" ").to_s }
    app_id { Faker::Number.number(1) }
  end
end