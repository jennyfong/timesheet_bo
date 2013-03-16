class BillDate < ActiveRecord::Base
  has_many :time_logs, :order => "position"

  validates_uniqueness_of :date, :scope => :user_id

  def initialize()
    self.user_id = User.first.id
  end

  def reorder
    position = 1
    self.time_logs.update_all(:position => 0)
    self.time_logs.order('start_time ASC').each do |time_log|
      time_log.position = position
      time_log.save
      position += 1

    end
    self.time_logs.reload
  end

  def calculate_duration
    self.reorder
    self.time_logs.each do |time_log|
      time_log.update_duration
    end
  end

  def year
    self.date.year
  end

  def month
    self.date.month
  end

  def day
    self.date.day
  end

  def started_at
    self.time_logs.first.start_time if self.time_logs.size > 0
  end

  def total_hours
    self.time_logs.all(:conditions => ["is_break = ? or is_break = ?", false, nil]).collect { |i| i.duration.to_i }.sum
  end

  def finished_at
    (self.time_logs.last.blank? || self.time_logs.last.end_time.blank?) ? '' : self.time_logs.last.end_time
  end

  def total_break
    self.time_logs.all(:conditions => ["is_break = ?", true]).collect{|i| i.duration.to_i}.sum
  end

end
