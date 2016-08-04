class TripSupply < ActiveRecord::Base
  belongs_to :trip
  belongs_to :supply

  def increase_quantity
    self.quantity += 1
  end

  def decrease_quantity
    self.quantity -= 1
  end
end
