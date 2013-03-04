require 'spec_helper'

describe HomesController do

  describe "#show" do
    before do
      get :show
    end

    it { should respond_with(:success) }
  end

end
