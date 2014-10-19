class List < ActiveRecord::Base
	belongs_to :user
	has_many :apps
	validates :name, presence: true
	acts_as_votable

  searchable do
    text :profession do
      user.professions.map { |profession| profession.name }
    end
  end
end