json.array!(@trips) do |trip|
  json.extract! trip, :id, :trip_name, :location, :user_id, :supplies, :to_do, :budget
  json.url trip_url(trip, format: :json)
end
