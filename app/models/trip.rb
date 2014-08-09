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

  def mail (html_email)
    m = Mandrill::API.new
    message = {  
     :subject=> "Hey, ! Here are the details for your upcoming trip!!",  
     :from_name=> "TravelJournal",
     :text=>"You've received a your trip information, but you have HTML emails disabled. Sorry!",  
     :to=>[  
       {  
         :email=> 'koren.cohen@gmail.com',
         :name=> 'Koren'
       }
     ],  
     :html=> html_email,  
     :from_email=> 'koren.cohen@gmail.com' 
    }  
    sending = m.messages.send message
end
end
