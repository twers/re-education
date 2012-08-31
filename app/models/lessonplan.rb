class Lessonplan < ActiveRecord::Base
	has_many :tasks
end
