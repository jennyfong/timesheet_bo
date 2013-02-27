class User < ActiveRecord::Base
  has_many :bill_dates
  has_many :time_logs, :through => :bill_dates


  def favourite_time_logs
    self.time_logs.all(:conditions => 'is_favourite is true')
  end
end
