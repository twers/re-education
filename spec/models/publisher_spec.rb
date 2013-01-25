# == Schema Information
#
# Table name: publishers
#
#  id                :integer          not null, primary key
#  avatar            :string(255)
#  email             :string(255)
#  alternative_name  :string(255)
#  short_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  password          :string(255)
#

require 'spec_helper'

describe Publisher do
  pending "add some examples to (or delete) #{__FILE__}"
end
