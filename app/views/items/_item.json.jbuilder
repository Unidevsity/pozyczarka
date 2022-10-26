json.extract! item, :id, :name, :active, :borrowed, :created_at, :updated_at
json.url item_url(item, format: :json)
