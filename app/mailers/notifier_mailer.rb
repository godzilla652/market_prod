class NotifierMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer'
  default from: "Astra <#{Settings['email.sender']}>"

  def reset_password_instructions(record, token, opts = {})
    headers["Custom-header"] = "Bar"
    opts[:from] = "Astra <#{Settings['email.sender']}>"
    opts[:subject] = "Astra App aps password reset request"
    @urlapp = Rails.application.config.action_mailer.default_url_options[:host]

    super
  end
end
