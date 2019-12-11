class Setting < RailsSettings::Base
  store Rails.root.join('config', 'default_settings.yml')
end
