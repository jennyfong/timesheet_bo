class BillDate < ActiveRecord::Base
  has_many :tasks, :order => "position"

end
