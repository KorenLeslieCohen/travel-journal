require 'open-uri'
require 'json'

class Photo

attr_accessor :name
def initialize(name)
  @name = name
end

def by_name
    photo_array = []

    source = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=6e96e1e952e27fbdf09f7a4799938b3b&tags=travel&culture&sort=interestingness-desc&safe_search=1&location=#{@name}&radius=32&radius_units=km&format=json&nojsoncallback=1&extras=path_alias%2Cowner_name"
    data = JSON.load(open(source))
    
    if data["photos"]["photo"].empty? || 2 > data["photos"]["photo"].count || index = nil
      by_name
    end

    count = data["photos"]["photo"].count - 1

    index = rand(1..[20, count].min )

    farm_id = data["photos"]["photo"][index]["farm"]
    server_id = data["photos"]["photo"][index]["server"]
    id = data["photos"]["photo"][index]["id"]
    secret = data["photos"]["photo"][index]["secret"]
    owner = data["photos"]["photo"][index]["owner"]

    @photo_url = "http://flickr.com/#{owner}/#{id}"

    @author = data["photos"]["photo"][index]["ownername"]

    photo_array << "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}_b.jpg"
  end

  def author
    @author
  end

  def location
    @location
  end

  def photo_url
    @photo_url
  end

end