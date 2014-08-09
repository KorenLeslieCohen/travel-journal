class Trip < ActiveRecord::Base
  belongs_to :user

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
     :subject=> "Hey, #{current_user.name}! Here are the details for your upcoming trip!!",  
     :from_name=> "TravelJournal",
     :text=>"You've received a your trip information, but you have HTML emails disabled. Sorry!",  
     :to=>[  
       {  
         :email=> current_user.email,  
         :name=> current_user.name 
       }
     ],  
     :html=>html_email,  
     :from_email=> user.email  
    }  
    sending = m.messages.send message
end
end
