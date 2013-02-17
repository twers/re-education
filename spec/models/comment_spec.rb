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

describe Comment do

  describe 'valid' do

    let(:publisher) { FactoryGirl.create :publisher }
    let(:lessonplan) { FactoryGirl.create :lessonplan, publisher: publisher }

    specify { Comment.new().should_not be_valid }

    specify do 
      comment = Comment.new(lessonplan: lessonplan, publisher: publisher, content: '   ')
      comment.should_not be_valid
    end

    specify { Comment.new(lessonplan: lessonplan, publisher: publisher, content: 'text content').should be_valid }



  end


end
