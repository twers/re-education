class Feedback < ActiveRecord::Base

  # if email must presence, why email format validate allow_blank is true ??

  validates :email, :body, :presence => true
  validates :email, :format => { :with => /^[a-z0-9+\-_\.]+@[a-z0-9\-_\.]+\.[a-z]{2,}$/i }, :allow_blank => true

end
