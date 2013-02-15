# -*- coding: utf-8 -*-

require 'spec_helper'

describe "lessons related functions", type: :feature do


  context "create lessons" do


    context "without logging in" do

      before { visit "/lessonplans/new" }

      # It's weird, why not go to login page?
      it "should redirect me to index page" do
        page.should have_content "新的课堂，你来设计"
      end
    end

    context "logged in" do
      let!(:user) { FactoryGirl.create(:publisher) }

      before do
        visit "/login"
        fill_in 'Email', with: user.email
        fill_in 'publisher_password', with: '123123'
        click_button '登录'
        page.should have_content "个人信息"
        visit "/lessonplans/new"
      end

      it "should visitable" do
        page.should have_content "教程介绍"
      end

      context "without tasks" do
        it "should create a new plan" do
          fill_in 'lessonplan_title', with: "This is a new plan"
          fill_in 'lessonplan_short_description', with: "This is a description isn't it?"
          fill_in 'lessonplan_content', with: "hmmm... It's a good editor, isn't it?"

          click_button "保存"

          page.should have_content "评论"
        end
      end

      # There is a bug when creating tasks.
      context "with tasks" do
      end

    end
  end
end
