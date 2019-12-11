object @entity => nil
attributes :id,  :proposed_text, :price, :concierge_read, :hire_read

node(:is_assigned){|x| x.assigned?}
node(:created_at){|x| x.created_at.strftime("%^b %d %Y")}
node(:concierge){|x| partial("api/users/_user", :object => x.user)}
