class TimeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill_date

  validates_presence_of :start_time
  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :bill_date

  after_create :calculate_duration

  validates_uniqueness_of :start_time, :scope => :bill_date

  def calculate_duration

  end

end
