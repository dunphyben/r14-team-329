class ListSearch
  def self.search(q)
    q = sanitize_fields(q)
    results = List.search { fulltext: q }
  end
  
  
end