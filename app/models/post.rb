class Post < ActiveRecord::Base
  validates :offer, :description, :company,
            :presence => true
end
