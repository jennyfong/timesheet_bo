class BillDate < ActiveRecord::Base
  has_many :time_logs, :order => "position"

  validates_uniqueness_of :date, :scope => :user_id

  def reorder
    position = 0
    self.time_logs.update_all(:position => 0)
    self.time_logs.order('start_time ASC').each do |time_log|
      time_log.position = position
      time_log.save
      position += 1

    end
  end

  def calcuate_duration
    self.reorder
    self.time_logs.each do |time_log|
      time_log.calculate_duration
    end
  end

  def total_hours
    self.time_logs.select{|i| !i.is_break?}.collect{|i|i.duration.to_i}.sum
  end

end
