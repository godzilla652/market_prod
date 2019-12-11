object @entities => false
attributes :id, :latitude, :longitude, :address, :task_id
child(:task) do
  attributes :title, :description, :date_limit, :budget
  node(:is_owner){|task| task.owner?(@current_user)}
end
