object @entity => nil
attributes :id, :title, :description, :phone, :task_type, :concierge_id, :latitude, :longitude, :address, :status,
 :budget, :suggestions_counter, :project_task_id, :tender, :suggestion_id, :city

node(:photo){|task| task.photo.url(:big)}
node(:photo1){|task| task.photo1.url(:big)} if @entity.photo1.exists?
node(:photo2){|task| task.photo2.url(:big)} if @entity.photo2.exists?
node(:photo3){|task| task.photo3.url(:big)} if @entity.photo3.exists?
node(:photo4){|task| task.photo4.url(:big)} if @entity.photo4.exists?
node(:photo5){|task| task.photo5.url(:big)} if @entity.photo5.exists?
node(:photo6){|task| task.photo6.url(:big)} if @entity.photo6.exists?
node(:photo7){|task| task.photo7.url(:big)} if @entity.photo7.exists?

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
node(:owner){|task| partial('api/users/show', :object => task.owner)}
child(:place) do
    attributes :latitude, :longitude, :address, :apartment
end
child(:line_tasks) do
    attributes :id, :title, :budget, :type_line, :status, :task_id
end

