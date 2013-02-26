class NotificationsMailer < ActionMailer::Base
  default :from => "twersip@gmail.com"
  default :to => "twersip@gmail.com"

  def new_feedback(feedback)
    @feedback = feedback
    mail(:subject => "[YourWebsite.tld] #{feedback.body}")
  end
end
