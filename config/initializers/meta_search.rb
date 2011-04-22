# need to work out how to split the param 
MetaSearch::Where.add :multiterm,
  :predicate => :matches,
  :formatter => '"%#{param}%"'

  