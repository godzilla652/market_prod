json.extract! vehicle, :id, :fleet, :year, :make, :km, :license, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
