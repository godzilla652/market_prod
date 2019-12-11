json.extract! permission, :id, :action, :subject_class, :subject_id, :role_id, :created_at, :updated_at
json.url admin_permission_url(permission, format: :json)
