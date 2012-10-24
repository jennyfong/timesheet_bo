class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :start_time
  validates_presence_of :user
  validates_presence_of :title

end
