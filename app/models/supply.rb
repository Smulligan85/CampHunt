class Supply < ActiveRecord::Base
  belongs_to :trip

  validates :name, :presence => true
  validates :quantity, :presence => true
end
