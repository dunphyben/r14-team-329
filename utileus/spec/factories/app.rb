FactoryGirl.define do

	# def fake_url
 #  		websites = %w(evernote.com rubyonrails.org rubular.com ruby-doc.org railscasts.com)
	# 	websites.sample
	# end

	factory :app do
		name { Faker::Lorem.word }
		url { Faker::Internet.url }
		list_id { Faker::Number.number(1) }
	end
end
