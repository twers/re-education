module ReEducation
  module TestHelpers
    def sign_in_publisher(publisher)
      controller.stub(:current_user).and_return(publisher)
    end
  end
end

RSpec.configure do |config|
  config.include ReEducation::TestHelpers
end
