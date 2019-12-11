object @user => nil
attributes :id, :first_name, :last_name, :user_name, :phone1,
        :email, :country, :city, :street, :postal_code,
        :phone2, :cardholder_name, :card_number, :cvk,
        :exp_month, :exp_year, :description, :is_logged_in

node(:photo){|u| u.photo.url(:medium)}

node(:hire_rating){|u| u.rating('hire')}
node(:concierge_rating){|u| u.rating('concierge')}
node(:balance){|u| "%.2f" % u.balance unless u.balance.nil?}


node(:closed_deals_concierge){|u| u.deals('concierge')}
node(:closed_deals_hire){|u| u.deals('hire')}
node(:current_server_time){Time.now.strftime("%m-%d-%Y   %I:%M%p")}
node(:blocked_to){|u| u.blocked_to.strftime("%m-%d-%Y   %I:%M%p") unless u.blocked_to.nil?}

node(:hire_unread_messages){@current_user.hire_unread_messages unless @current_user.nil?}
node(:concierge_unread_messages){@current_user.concierge_unread_messages unless @current_user.nil?}
node(:role){|u| u.contract&.team ? 'hire' : 'contractor' }
node(:permissions){|u| partial('api/users/permissions', :object => (@perms = u.role&.permissions))}
