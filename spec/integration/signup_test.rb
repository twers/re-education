# -*- coding: utf-8 -*-
require 'spec_helper'

describe "the signup process", :type => :feature do
  let(:user) { double(:user, email: 'poshboytl@gmail.com',  username: 'poshboytl', password: '123321')}

  it "should successfully signup a publisher"do
    visit '/publishers/new'
    page.should have_content '用户注册'
    fill_in 'Email', with: user.email
    fill_in 'publisher_alternative_name', with: user.username
    fill_in 'password_copy', with: user.password
    fill_in 'publisher_password', with: user.password
    click_button '保存'
    page.should have_content '个人信息'
    page.should have_content user.username
  end
end
