# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  access_token :string(255)
#  unique_id    :string(255)
#  nick_name    :string(255)
#  avatar_url   :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
