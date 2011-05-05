class User < ActiveRecord::Base
  ActiveSupport::Deprecation.silenced = true
  acts_as_authentic

  validates :username,
            :uniqueness => true
end
