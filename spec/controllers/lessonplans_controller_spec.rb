require 'spec_helper'

describe LessonplansController do

  let(:publisher) do
    FactoryGirl.create :publisher
  end

  before :each do
    controller.stub(:current_user).and_return(publisher)
  end

  describe :index do
    it "lists 4 latest lesson plans" do
      10.times do |i|
        FactoryGirl.create :lessonplan, title: "test_plan_#{i}", created_at: (60-i).seconds.ago
      end
      
      get :index
      listed_plans = assigns(:lessonplans)
      listed_plans.should have(4).plans
      listed_plans.first.title.should == "test_plan_9"
    end
  end
  
  describe :create do

    it "creates one lesson plan and redirect to show page" do
      expect do
        post :create, :lessonplan => {:title => 'test_plan', :content => 'This is a test plan.'}
      end.to change(Lessonplan, :count).by(1)

      response.should redirect_to(lessonplan_path(Lessonplan.last))
    end
    
    it "creates tasks and associates them to one lesson plan" do
      expect do
        post :create, :lessonplan => {:title => 'test_plan', :content => 'This is a test plan.'},
                      :tasks => [{:title => 'test_task', :content => 'This is a test task.'}]
      end.to change(Task, :count).by(1)
      Lessonplan.last.tasks.should have(1).task
      Lessonplan.last.tasks.first.title.should == 'test_task'
    end
  end

  describe :update do

    let!(:lessonplan) { FactoryGirl.create :lessonplan, publisher: publisher }
    let(:params) do
      { :id => lessonplan.id,
        :lessonplan => { title: 'test_plan', content: 'This is a test plan.' },
        :tasks => [{ title: 'test_task', content: 'This is a test task.' }] }
    end
    
    before do
      put :update, params
      lessonplan.reload
    end

    subject { lessonplan }

    its(:title) { should  == 'test_plan' }
    its(:content) { should == 'This is a test plan.' }

    specify { lessonplan.tasks.count.should == 1 }

    specify { lessonplan.tasks.first.title.should == 'test_task' }

    specify { response.should redirect_to(lessonplan_path(Lessonplan.last)) }

  end

  describe :destroy do

    let(:lessonplan) { FactoryGirl.create :lessonplan, publisher: publisher }

    before :each do
      delete :destroy, id: lessonplan.id
    end

    specify { lessonplan.destroyed? }
    
    specify { response.should redirect_to(root_path) }

  end
end
