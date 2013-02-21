# -*- coding: utf-8 -*-

require 'spec_helper'

describe "publisher related functions", :type => :feature do
  let!(:publisher) { FactoryGirl.create(:publisher) }

  before do
    login_as publisher
    visit edit_publisher_path(publisher)
  end

  specify { page.should have_button "保存" }

  context "update profile" do

    it "should update publisher" do
      fill_in "publisher_alternative_name", with: "Tester user"
      fill_in "publisher_short_description", with: "Tester user description"
      click_button "保存"

      page.should have_link "编辑"
      page.should have_content "Tester user"
      page.should have_content "Tester user description"
    end

  end

end