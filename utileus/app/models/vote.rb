 class Vote < ActiveRecord::Base

 	# extend FriendlyID
 	# friendly_id :name, use: :slugged

 	belongs_to :user
 	belongs_to :list
 	belongs_to :app 

 end