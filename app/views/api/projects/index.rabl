object @entities

attributes :id, :number, :name, :address, :type_pt, :description, :active

node(:count_task){|e| @counts.count(e.id)} if @counts.present?
