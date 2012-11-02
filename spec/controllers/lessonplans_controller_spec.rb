require 'spec_helper'

describe LessonplansController do

  let(:user) do
    mock_model User, :id => 10000
  end

  before :each do
    controller.stub(:current_user).and_return(user)
  end

  describe :index do
    it "lists 4 latest lesson plans" do
      10.times do |i|
        plan = Lessonplan.create!(:title => "test_plan_#{i}")
        plan.update_attribute(:created_at, (60-i).seconds.ago)
      end
      
      get :index
      listed_plans = assigns(:lessonplans)
      listed_plans.should have(4).plans
      listed_plans.first.title.should == "test_plan_9"
    end
  end
  
  describe :create do

    it "creates one lesson plan and redirect to show page" do
      lambda do
        post :create, :lessonplan => {:title => 'test_plan', :content => 'This is a test plan.'}
      end.should change(Lessonplan, :count).by(1)

      response.should redirect_to(lessonplan_path(Lessonplan.last))
    end
    
    it "creates tasks and associates them to one lesson plan" do
      lambda do
        post :create, :lessonplan => {:title => 'test_plan', :content => 'This is a test plan.'},
                      :tasks => [{:title => 'test_task', :content => 'This is a test task.'}]
      end.should change(Task, :count).by(1)
      Lessonplan.last.tasks.should have(1).task
      Lessonplan.last.tasks.first.title.should == 'test_task'
    end
  end

  describe :update do

    before :each do
      @params = { 
        :id => '1',
        :lessonplan => { "title" => 'test_plan', "content" => 'This is a test plan.' },
        :tasks => [{ :title => 'test_task', :content => 'This is a test task.' }]
      };

      @lessonplan = mock_model(Lessonplan, :user => user)
      Lessonplan.stub(:find).with('1').and_return(@lessonplan)
      @lessonplan.stub_chain(:tasks, :delete_all)
    end

    it "should update the lessonplan" do
      @lessonplan.should_receive(:update_attributes).with(@params[:lessonplan])
      put :update, @params
    end

    it "should redirect to lessonplan path" do
      @lessonplan.stub(:update_attributes)
      put :update, @params
      response.should redirect_to(lessonplan_path(@lessonplan))
    end

  end

  describe :destroy do

    before :each do
      @lessonplan = mock_model(Lessonplan, :user => user)
      Lessonplan.stub(:find).with('1').and_return(@lessonplan)
    end

    it 'should destroy the lesson plan' do
      @lessonplan.should_receive(:destroy)
      delete :destroy, :id => '1'
    end

    it 'should redirect to the homepage' do
      delete :destroy, :id => '1'
      response.should redirect_to(root_url)
    end
  end
end
