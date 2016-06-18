class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :supplies

  validates :name, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
end
