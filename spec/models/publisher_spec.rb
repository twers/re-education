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
  subject { FactoryGirl.create(:publisher) }

  describe "#avatar_link" do
    its(:avatar_link) { should == "/assets/avatar.png" }

    it "should return the real url" do
      subject.stub(:avatar_url).and_return("/real/avatar/url")
      subject.avatar_link.should == "/real/avatar/url"
    end
  end

  describe "#super_manager?" do
    it { should_not be_super_manager }

    it "should be super manager for user named openclass" do
      subject.alternative_name = 'openclass'
      subject.should be_super_manager
    end
  end
end
