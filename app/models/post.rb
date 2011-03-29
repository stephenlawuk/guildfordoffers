class Post < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :offer, :description, :company,
            :presence => true

  validates :email,
            :format => { :with => email_regex }

end
