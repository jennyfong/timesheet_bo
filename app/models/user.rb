class User < ActiveRecord::Base
  has_many :timelogs
end
