class Usersupply < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :supply_id
end
