require 'spec_helper'

describe SiteController do

  describe "GET about" do
    before { get :about }

    it { should respond_with :success }
    it { should render_template :about }
  end

end

