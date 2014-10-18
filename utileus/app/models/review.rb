 class Review < ActiveRecord::Base

 	# extend FriendlyID
 	# friendly_id :name, use: :slugged

 	belongs_to :reviewed, polymorphic: true
 	## polymorphic association made more sense.
 	## creating a has_many through: relationship was not working

 end