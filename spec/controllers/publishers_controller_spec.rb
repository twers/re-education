require 'spec_helper'

describe PublishersController do
  let(:publisher) { FactoryGirl.create(:publisher) }

  describe "#new" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
  end

  describe "#create" do
  end

  describe "#edit" do
    before do
      sign_in_publisher(publisher)
      get :edit, id: publisher.id
    end

    it { should respond_with(:success) }
    it { should render_template(:edit) }
    it { assigns(:publisher).should == publisher }
  end

  describe "#show" do
    before do
      get :show, id: publisher.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { assigns(:publisher).should == publisher }
  end

  describe "#update" do
    context "#successful update" do
      before do
        sign_in_publisher(publisher)
        Publisher.stub(:find).with(publisher.id.to_s).and_return(publisher)
        publisher.stub(:update_attributes).and_return(true)
        put :update, id: publisher.id, publisher: { alternative_name: 'alternative name' }
      end

      it { should redirect_to(publisher_path(publisher)) }
    end

    context "#failed update" do
      before do
        sign_in_publisher(publisher)
        Publisher.stub(:find).with(publisher.id.to_s).and_return(publisher)
        publisher.stub(:update_attributes).and_return(false)
        put :update, id: publisher.id, publisher: { alternative_name: 'alternative name' }
      end

      it { should render_template(:edit) }
    end
  end
end
