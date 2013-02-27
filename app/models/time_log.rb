class TimeLog < ActiveRecord::Base

  belongs_to :bill_date

  acts_as_list :scope => :bill_date

  validates_presence_of :start_time
  validates_presence_of :title
  validates_presence_of :bill_date

  after_create :update_duration

  validates_uniqueness_of :start_time, :scope => :bill_date_id

  before_destroy :update_previous

  before_create :update_reference_title

  belongs_to :issue, :foreign_key => 'reference_id'

  validate :end_time_before_start_time, :on => :update

  def initialize(options)
    super(options)
    self.start_time = Time.now
    self.bill_date = BillDate.find_by_date(Date.today)
  end


  def end_time_before_start_time
    unless self.end_time.blank? or (self.end_time > self.start_time)
      return false
    end
  end

  def update_reference_title
    unless self.reference_id.blank?
      subject = Issue.get_subject(self.reference_id)
      self.title = subject unless subject.blank?
    end
  end

  def update_duration
    self.bill_date.reorder
    self.reload

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
    if self.end_time && self.start_time
      self.duration = self.end_time - self.start_time
    else
      self.duration = nil
    end
    self.save
  end

  def update_previous
    unless self.higher_item.blank?
      higher_item = self.higher_item
      higher_item.end_time = self.lower_item ? self.lower_item.start_time : nil
      higher_item.calculate_duration
      higher_item.save
    end
  end


end
