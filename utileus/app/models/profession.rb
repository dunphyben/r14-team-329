 class Profession < ActiveRecord::Base

 	# extend FriendlyID
 	# friendly_id :name, use: :slugged

 	has_and_belongs_to_many :users

 end