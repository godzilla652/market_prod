object @user => nil
attributes :id, :first_name, :last_name, :user_name, :phone1,
        :email, :country, :city, :street, :postal_code,
        :phone2, :cardholder_name, :card_number, :cvk,
        :exp_month, :exp_year, :description, :balance, :blocked_to

node(:hire_rating){|u| u.rating('hire')}
node(:concierge_rating){|u| u.rating('concierge')}

node(:closed_deals_concierge){|u| u.deals('concierge')}
node(:closed_deals_hire){|u| u.deals('hire')}

node(:photo){|u| u.photo.url(:medium)}

node(:hire_unread_messages){@current_user.hire_unread_messages unless @current_user.nil?}
node(:concierge_unread_messages){@current_user.concierge_unread_messages unless @current_user.nil?}

