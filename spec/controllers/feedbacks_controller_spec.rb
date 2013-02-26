require 'spec_helper'

describe FeedbacksController do

  describe '#new' do

    before { get :new }

    it { should respond_with(:success) }
    it { should render_template(:new) }
    specify { assigns(:feedback).should be_an_instance_of(Feedback) }

  end

  describe '#create' do

    context 'with empty fields' do

      before { post :create, feedback: {} }
      it { should respond_with(:success) }
      it { should render_template(:new) }

    end

    context 'with valid fields' do
      let(:new_feedback_mailer) { stub(:mailer)}

      before do 
        NotificationsMailer.stub(:new_feedback).and_return(new_feedback_mailer)
        new_feedback_mailer.should_receive(:deliver)
        post :create, feedback: { email: 'test@example.com', body: 'this is feedback body' }
      end

      it { should respond_with(:success) }
      it { should render_template(:create) }

    end

  end

end
