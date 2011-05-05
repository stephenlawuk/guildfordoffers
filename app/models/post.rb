class Post < ActiveRecord::Base
  ActiveSupport::Deprecation.silenced = true
  validates :offer, :description, :company,
            :presence => true
  
  # offer_or_description_or_company_or_metadata_like
  # meta_search method (dunno how to scope it)

# Code fragments from various trials

#  scope :keywords, lambda { |keyword|
 #   return if keywords.blank?
#
 #   keywords.split(' ').each do |keyword|
 #     keyword = '%' << keyword << '%'
  #  end
  #  }

 # scope :keywords, lambda {
 #   |query|
 #     where(query.split(/\s+/))
  #  }

#  search_methods :keywords

  #undefined method `offer_or_description_or_company_or_metadata_like'

  # searchlogic scope not current used
  #scope :keywords, lambda { |query| Post.find_by_company(query.split(/\s+/))}
end
