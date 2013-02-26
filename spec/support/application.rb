# -*- coding: utf-8 -*-
module ReEducation
  module TestHelpers
    def sign_in_publisher(publisher)
      controller.stub(:current_user).and_return(publisher)
    end

    def login_as publisher
      visit "/login"
      fill_in 'Email', with: publisher.email
      fill_in 'publisher_password', with: '123123'
      click_button '登录'
    end

  end
end

RSpec.configure do |config|
  config.include ReEducation::TestHelpers
end
