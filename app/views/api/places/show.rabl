object @entity => nil
attributes :id, :latitude, :longitude, :address
child(:task) { attributes :title, :description, :date_limit, :budget }
