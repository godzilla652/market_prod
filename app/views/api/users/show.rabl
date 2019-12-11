object @user => nil
node(false) { |user| partial('api/users/user', :object => user)}
