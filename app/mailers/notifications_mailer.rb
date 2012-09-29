class NotificationsMailer < ActionMailer::Base
  default :from => "twersip@gmail.com"
  default :to => "twersip@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.body}")
  end
end
