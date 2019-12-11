class ApplicationMailer < ActionMailer::Base
  default from: "Astra <#{Settings['email.sender']}>"
  layout 'mailer'
end
