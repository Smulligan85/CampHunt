class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_supplies
  has_many :supplies, :through => :trip_supplies

  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validate :end_after_start
  validates :start_date, :presence => true
  validates :end_date, :presence => true

  accepts_nested_attributes_for :supplies

  def self.upcoming
    Trip.where(:start_date => Date.today..(Date.today + 1.months))
  end

  def start_date_formatter
    self.start_date.strftime("%B %d, %Y")
  end

  def end_date_formatter
    self.end_date.strftime("%B %d, %Y")
  end

  private
    def end_after_start
      return if end_date.blank? || start_date.blank?

      if end_date < start_date
        errors.add(:end_date, "must be after the start date")
      end
    end

end
