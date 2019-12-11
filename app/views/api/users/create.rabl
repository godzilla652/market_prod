object false
node(:access_token) { |x|  @token }
node(:token_type) { |x|  "bearer"}

node(:user) { |x|  partial( "api/users/me", :object => @user) }
