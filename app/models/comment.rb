class Comment < ActiveRecord::Base
	belongs_to :lessonplan
	belongs_to :publisher
end
