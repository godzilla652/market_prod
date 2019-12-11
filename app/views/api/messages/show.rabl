object @entities => false
attributes :id, :message_body, :task_id, :system, :type_message, :suggestion_id, :rating, :points, :give_a_rate, :file,
 :id_line_task, :title, :budget, :budget_task, :total, :type_line, :status

node(:profent){|mes| mes.task.profent_full}
node(:created_at){|x| x.created_at.strftime("%^b %d %Y")}
node(:is_author){|mess| mess.author?(@current_user)}
node(:author) { |mess| partial('api/users/user', :object => mess.author )}
node(:recipient) { |mess| partial('api/users/user', :object => mess.recipient )}
