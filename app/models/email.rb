class Email < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            :uniqueness => true,
            :format => { :with => email_regex }
end
