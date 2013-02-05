# -*- coding: utf-8 -*-
require 'spec_helper'

describe "login and logout process", type: :feautre do
  let!(:user) { FactoryGirl.create(:publisher) }

  context "login" do
    before { visit '/login' }

    it "should be visitable" do
      page.should have_content '登录'
    end

    it "should login successfully when login info is correct" do
      fill_in 'Email', with: user.email
      fill_in 'publisher_password', with: '123123'
      click_button '登录'
      page.should have_content "个人信息"
    end

    it "should not login when password is incorrect" do
      fill_in 'Email', with: user.email
      fill_in 'publisher_password', with: 'xmanxman'
      click_button '登录'
      page.should_not have_content "个人信息"
    end

  end

  context "logout" do
    before do
      visit '/login'
      page.should have_content '登录'
      fill_in 'Email', with: user.email
      fill_in 'publisher_password', with: '123123'
      click_button '登录'
      click_link '退出'
    end

    it "should redirect me to index page" do
      page.should have_content "新的课堂，你来设计"
    end

    it "should see login link" do
      page.should have_content "登录"
    end
  end

end
