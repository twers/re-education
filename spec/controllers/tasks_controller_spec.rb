require 'spec_helper'

describe TasksController do

  let(:publisher) { FactoryGirl.create :publisher }
  let(:lessonplan) { FactoryGirl.create :lessonplan, publisher: publisher }

  describe '#index' do
    
    before do

      10.times { |i| FactoryGirl.create :task, lessonplan: lessonplan }
      get :index, lessonplan_id: lessonplan.id

    end

    it { should respond_with(:success) }
    specify { JSON.parse(response.body).size.should == 10 }

  end

  describe '#create' do

    before do
      post :create, lessonplan_id: lessonplan.id, task: { title: 'task title', content: 'task content' }
    end

    it { should respond_with(:success) }
    specify { JSON.parse(response.body)['title'].should == 'task title' }
    specify { JSON.parse(response.body)['content'].should == 'task content' }
      
  end

end
