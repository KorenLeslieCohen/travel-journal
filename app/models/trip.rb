class Trip < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :trip_name

  before_save :set_defaults
  after_initialize :set_defaults

  protected

  def set_defaults
    self.to_do = "(empty)" if self.to_pack == nil
  end
end
