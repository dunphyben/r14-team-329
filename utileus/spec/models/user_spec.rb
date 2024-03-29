require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many :lists }
  it { should have_and_belong_to_many :professions }
  it { should have_many :reviews }
end
