class NotificationsMailer < ActionMailer::Base
  default :from => "localhost"
  default :to => "localhost"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.email}")
  end
end
