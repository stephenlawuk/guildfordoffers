class Post < ActiveRecord::Base
  validates :offer, :description, :company,
            :presence => true
  
  # offer_or_description_or_company_or_metadata_like
  # meta_search method (dunno how to scope it)

 # scope :keywords, lambda {
 #   |query|
 #     where(query.split(/\s+/))
  #  }

 # search_methods :keywords

  #undefined method `offer_or_description_or_company_or_metadata_like'

  # searchlogic scope not current used
  #scope :keywords, lambda { |query| Post.find_by_company(query.split(/\s+/))}
end
