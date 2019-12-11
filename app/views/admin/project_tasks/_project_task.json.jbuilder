json.extract! project_task, :id, :name, :address, :type, :description, :active, :created_at, :updated_at
json.url project_task_url(project_task, format: :json)
