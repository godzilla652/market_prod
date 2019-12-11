json.extract! equipment, :id, :name, :category_id, :description, :total_owned, :available, :assigned, :damaged, :created_at, :updated_at
json.url equipment_url(equipment, format: :json)
