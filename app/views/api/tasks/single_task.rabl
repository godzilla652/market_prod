object @entity => nil
attributes :id, :title, :description, :phone, :task_type, :concierge_id, :latitude, :longitude, :address, :status,
:budget, :suggestions_counter, :project_task_id, :tender, :suggestion_id, :city

node(:photo){|task| task.photo.url(:big)}
node(:photo1, :unless => lambda {|t| t.photo1.url == "/photo1s/original/missing.png"}){|task| task.photo1.url(:big)}
node(:photo2, :unless => lambda {|t| t.photo2.url == "/photo2s/original/missing.png"}){|task| task.photo2.url(:big)}
node(:photo3, :unless => lambda {|t| t.photo3.url == "/photo3s/original/missing.png"}){|task| task.photo3.url(:big)}
node(:photo4, :unless => lambda {|t| t.photo4.url == "/photo4s/original/missing.png"}){|task| task.photo4.url(:big)}
node(:photo5, :unless => lambda {|t| t.photo5.url == "/photo5s/original/missing.png"}){|task| task.photo5.url(:big)}
node(:photo6, :unless => lambda {|t| t.photo6.url == "/photo6s/original/missing.png"}){|task| task.photo6.url(:big)}
node(:photo7, :unless => lambda {|t| t.photo7.url == "/photo7s/original/missing.png"}){|task| task.photo7.url(:big)}

node(:rating_present){|task| task.rating_present}
node(:gst_percent){|task| task.gst_calc}
node(:total){|task| task.total_sum}
node(:profent){|task| task.profent_full}
node(:is_favorite){|task| task.favorite?(@current_user)}
node(:date_start){|task| task.date_start.strftime("%^b %d %Y") unless task.date_start.nil?}
node(:date_limit){|task| task.date_limit.strftime("%^b %d %Y") unless task.date_limit.nil?}
node(:fact_start){|task| task.fact_start.strftime("%^b %d %Y") unless task.fact_start.nil?}
node(:fact_end){|task| task.fact_end.strftime("%^b %d %Y") unless task.fact_end.nil?}
node(:is_owner){|task| task.owner?(@current_user)}
node(:project){|task| task.project_task.name if task.project_task }
node(:concierge){|task| task.concierge.legal_title if task.concierge }
child(:line_tasks) do
    attributes :id, :title, :budget, :type_line, :status, :task_id
end

node(:owner){|task| partial('api/users/show', :object => task.owner)}
child(:place) do
    attributes :latitude, :longitude, :address, :apartment
end


