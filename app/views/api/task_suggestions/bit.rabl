object @entity => nil
attributes :id,  :proposed_text, :price, :hire_read, :concierge_read

node(:is_assigned){|x| x.assigned?}
node(:created_at){|x| x.created_at.strftime("%^b %d %Y")}
node(:task){ |x| partial("api/tasks/_task_short", :object => x.task)}
node(:message) {|x| partial("api/messages/_message_short", :object => x.messages.last)}
