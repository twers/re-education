# -*- coding: utf-8 -*-
require 'spec_helper'

describe "the signup process", type: :feature do
  let(:user) { double(:user, email: 'poshboytl@gmail.com',  username: 'poshboytl', password: '123321') }

  before { visit '/publishers/new' }

  it "should be visitable" do
    page.should have_content '用户注册'
  end

  context "successfully signup" do
    it do
      fill_in 'Email', with: user.email
      fill_in 'publisher_alternative_name', with: user.username
      fill_in 'publisher_password_confirmation', with: user.password
      fill_in 'publisher_password', with: user.password
      fill_in 'publisher_captcha', with: SimpleCaptcha::SimpleCaptchaData.first.value
      click_button '保存'
      page.should have_content '个人信息'
      page.should have_content user.username
    end
  end

  context "failed to signup" do

    it "should ask you to input email" do
      fill_in 'publisher_alternative_name', with: user.username
      fill_in 'publisher_password_confirmation', with: user.password
      fill_in 'publisher_password', with: user.password
      click_button '保存'
      page.should have_content "邮箱地址为必填写项"
    end

    it "should ask you to input username" do
      fill_in 'Email', with: user.email
      fill_in 'publisher_password_confirmation', with: user.password
      fill_in 'publisher_password', with: user.password
      click_button '保存'
      page.should have_content "用户名为必填写项"
    end

    it "should ask you to input the password" do
      fill_in 'Email', with: user.email
      fill_in 'publisher_alternative_name', with: user.username
      click_button '保存'
      page.should have_content "密码为必填写项"
    end

    it "should tell you the confirmation is not match" do
      fill_in 'Email', with: user.email
      fill_in 'publisher_alternative_name', with: user.username
      fill_in 'publisher_password_confirmation', with: user.password
      fill_in 'publisher_password', with: user.password + 'xman'
      click_button '保存'
      page.should have_content "两次密码输入不一致"
    end
  end

end
