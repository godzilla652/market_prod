
require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module FreeBe
  class Application < Rails::Application
    config.load_defaults 5.2
    #config.force_ssl = true
    #config.middleware.insert_before ActionDispatch::Cookies, "Rack::SSL"
    config.autoload_paths += Dir[
        "#{config.root}/app/services",
        "#{config.root}/app/builders",
        "#{config.root}/lib",
        "#{config.root}/blueprinters",
        "#{config.root}/value_objects",
        "#{config.root}/interactors",
        "#{config.root}/constants",
        "#{config.root}/app/stylesheets"
    ]
  end
end
