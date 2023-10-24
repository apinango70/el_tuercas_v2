json.extract! service, :id, :service_name, :spare_parts, :deadline, :status, :vehicle_id, :created_at, :updated_at
json.url service_url(service, format: :json)
