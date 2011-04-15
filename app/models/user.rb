class User < ActiveRecord::Base
  ActiveSupport::Deprecation.silenced = true
  acts_as_authentic
end
