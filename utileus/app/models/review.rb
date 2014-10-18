 class Review < ActiveRecord::Base
 	# extend FriendlyID
 	# friendly_id :name, use: :slugged

 	belongs_to :app

 end