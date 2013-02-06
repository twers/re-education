# encoding: UTF-8

Given /^I am on the index page$/ do
  visit "/"
end

When /^I press enter$/ do
  #p page.content
  page.should have_content '新的课堂，你来设计'
  click_link "进入"

end

Then /^the lesson page should be displayed$/ do
  find("h2").should have_content 'Ruby on Rails Tutorial'
end