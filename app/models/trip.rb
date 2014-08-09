class Trip < ActiveRecord::Base
  has_many :trip_supplies
  has_many :supplies, through: :trip_supplies
  accepts_nested_attributes_for :supplies

  validates_presence_of :trip_name

  # before_save :set_defaults
  # after_initialize :set_defaults

  # protected

  # def set_defaults
  #   self.to_do = "(empty)" if self.to_pack == nil
  # end
end
