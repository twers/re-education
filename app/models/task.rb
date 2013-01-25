# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lessonplan_id :integer
#

class Task < ActiveRecord::Base
  belongs_to :lessonplan
end
