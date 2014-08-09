class Supply < ActiveRecord::Base
  has_many :trip_supplies
  has_many :trips, through: :trip_supplies
  
end
