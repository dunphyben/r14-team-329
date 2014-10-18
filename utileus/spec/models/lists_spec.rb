require 'rails_helper'

describe List do 
	it { should have_many :apps }
	it { should belong_to :user }
end