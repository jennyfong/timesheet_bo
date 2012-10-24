class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill_date

  validates_presence_of :start_time
  validates_presence_of :user
  validates_presence_of :title

end
