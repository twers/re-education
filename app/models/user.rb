class User < ActiveRecord::Base
	has_many :lessonplans
	has_one :publisher
end
