class TimeLog < ActiveRecord::Base

  belongs_to :bill_date

  acts_as_list :scope => :bill_date

  validates_presence_of :start_time
  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :bill_date

  after_create :calculate_duration

  validates_uniqueness_of :start_time, :scope => :bill_date_id

  def calculate_duration
     lower_time_log = self.lower_item
    if lower_time_log or (self.end_time && self.lower_item.blank?)
      self.end_time = lower_time_log.start_time if lower_time_log
      self.duration = self.end_time - self.start_time
      self.save
    else
      self.duration = nil
      self.save
    end

  end

  def self.reorder

  end



end
