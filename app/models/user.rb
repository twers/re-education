class User < ActiveRecord::Base
	has_many :lessonplans
end
