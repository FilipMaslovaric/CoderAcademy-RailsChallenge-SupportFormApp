class SupportMailer < ApplicationMailer
  def contact_support(from_email, message)
    @from_email = from_email
    @message = message
    my_email = ENV.fetch('EMAIL_TO')
    mail(to: my_email, subject: "Support Request from #{@from_email}")
  end
end
