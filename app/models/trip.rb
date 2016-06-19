class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :supplies

  validates :name, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true

  def self.upcoming
    Trip.where(:start_date => Date.today..(Date.today + 1.months))
  end

  def start_date_formatter
    self.start_date.strftime("%B %d, %Y")
  end

  def end_date_formatter
    self.end_date.strftime("%B %d, %Y")
  end
end
