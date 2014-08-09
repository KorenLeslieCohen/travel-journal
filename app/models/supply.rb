class Supply < ActiveRecord::Base
  has_many :user_supplies
  has_many :users, through: :user_supplies
  
end
