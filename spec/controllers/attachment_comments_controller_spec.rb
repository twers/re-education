require 'spec_helper'

describe AttachmentCommentsController do

  let!(:publisher) { FactoryGirl.create :publisher }
  let!(:current_user) { FactoryGirl.create :publisher }
  let!(:lessonplan) { FactoryGirl.create :lessonplan }
  let!(:lessonplan_attachment) { FactoryGirl.create :lessonplan_attachment, lessonplan: lessonplan }

  before :each do
    controller.stub(:current_user).and_return(current_user)
  end

  describe '#create' do

    context 'normal content' do
      before { post :create, lessonplan_id: lessonplan.id,
                    attachment_id: lessonplan_attachment.id,
                    content: 'test comment content' }
      specify { JSON.parse(response.body)['content'].should == 'test comment content' }
    end

    context 'empty content' do
      before { post :create, lessonplan_id: lessonplan.id,
                    attachment_id: lessonplan_attachment.id,
                    content: '' }
      specify { JSON.parse(response.body)['status'].should == 'empty' }
    end

    context 'duplicate content' do
      let!(:attachment_comment) {
        FactoryGirl.create :attachment_comment,
                           lessonplan_attachment: lessonplan_attachment,
                           publisher: current_user
      }
      before { post :create, lessonplan_id: lessonplan.id,
                    attachment_id: lessonplan_attachment.id,
                    content: attachment_comment.content }
      specify { JSON.parse(response.body)['status'].should == 'duplicate' }
    end
  end

  describe '#show' do
    before {
      10.times do
        FactoryGirl.create :attachment_comment, publisher: publisher,
                           lessonplan_attachment: lessonplan_attachment
      end

      get :show, lessonplan_id: lessonplan.id, attachment_id: lessonplan_attachment.id
    }

    specify { JSON.parse(response.body).size.should == 10 }
  end

end