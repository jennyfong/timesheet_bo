class TimeLog < ActiveRecord::Base

  belongs_to :bill_date

  acts_as_list :scope => :bill_date

  validates_presence_of :start_time
  validates_presence_of :title
  validates_presence_of :bill_date

  after_create :update_duration


  validates_uniqueness_of :start_time, :scope => :bill_date_id

  def update_duration
    self.bill_date.reorder

    lower_time_log = self.lower_item
    higher_item = self.higher_item

    if lower_time_log or (self.end_time && self.lower_item.blank?)
      self.end_time = lower_time_log.start_time if lower_time_log
      self.calculate_duration
    else
      self.duration = nil
      self.save
    end

    if higher_item
      higher_item.end_time = self.start_time
      higher_item.calculate_duration
    end

  end



  def calculate_duration
    self.duration = self.end_time - self.start_time
    self.save
  end


end
