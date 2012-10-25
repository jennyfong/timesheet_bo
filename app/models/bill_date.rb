class BillDate < ActiveRecord::Base
  has_many :time_logs, :order => "position"

end
