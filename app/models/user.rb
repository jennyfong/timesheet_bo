class User < ActiveRecord::Base
  has_many :bill_dates
  has_many :timelogs, :through => :bill_dates
end
