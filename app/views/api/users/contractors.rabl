object @users

attributes :id

node(:full_name){|u| u.legal_title if u.present?}
node(:gst_percent){|u| u&.contract&.gst_percent if u.present?}
node(:hire_rating){|u| u.rating('hire') if u.present?}
node(:concierge_rating){|u| u.rating('concierge') if u.present?}