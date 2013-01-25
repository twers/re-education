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

require 'spec_helper'

describe Task do
  pending "add some examples to (or delete) #{__FILE__}"
end
