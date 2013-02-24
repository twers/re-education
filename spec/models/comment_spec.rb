# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  content       :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lessonplan_id :integer
#  publisher_id  :integer
#

require 'spec_helper'
