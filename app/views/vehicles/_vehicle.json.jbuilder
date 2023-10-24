json.extract! vehicle, :id, :brand, :model, :plate_number, :user_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
