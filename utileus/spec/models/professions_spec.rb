require 'rails_helper'

describe Profession do 
	it { should have_and_belong_to_many :users }

end