# == Schema Information
#
# Table name: lessonplans
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string(255)
#  symbol_img_url    :string(255)
#  attachment        :string(255)
#  user_id           :integer
#  publisher_id      :integer
#

require 'spec_helper'

describe Lessonplan do
  pending "add some examples to (or delete) #{__FILE__}"
end
