 class Review < ActiveRecord::Base
 	belongs_to :app
 	validates :quick_review, presence: true

 end