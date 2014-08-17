class Trip < ActiveRecord::Base
  
  has_many :trip_supplies
  belongs_to :user
  has_many :supplies, through: :trip_supplies
  accepts_nested_attributes_for :supplies

  validates_presence_of :trip_name

  def mail (html_email)
    m = Mandrill::API.new
    message = { 
     :subject=> "Hey, #{User.find(user_id).name}! Here are the details for your upcoming trip, #{self.trip_name}!",  
     :from_name=> "TravelJournal",
     :text=>"You've received a your trip information, but you have HTML emails disabled. Sorry!",  
     :to=>[  
       {  
         :email=> User.find(user_id).email,
         :name=> User.find(user_id).name
        }
     ],  
     :html=> html_email,  
     :from_email=> 'traveljournalmy@gmail.com'
    }  
    sending = m.messages.send message
end
end
