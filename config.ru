# This file is used by Rack-based servers to start the application.

begin
  require ::File.expand_path("../config/environment",  __FILE__)
rescue Exception => error
  #Appsignal.send_error(error)
  raise
end

run Rails.application
