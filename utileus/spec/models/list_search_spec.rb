describe ListSearch do
  describe '.search' do
    it "searches for lists" do
      ListSearch.search(profession: 'tech')
      expect(Sunspot.session).to be_a_search_for(List) 
    end

    it "accepts one field" do
      
    end
  end
end