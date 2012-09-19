require 'spec_helper'

describe LessonplansController do
  describe :index do
    it "lists 4 latest lesson plans" do
      10.times do |i|
        plan = Lessonplan.create!(:title => "test_plan_#{i}")
        plan.update_attribute(:created_at, (60-i).minutes.ago)
      end
      
      get :index
      listed_plans = assigns(:lessonplans)
      listed_plans.should have(4).plans
      listed_plans.first.title.should == "test_plan_9"
    end
  end
end
