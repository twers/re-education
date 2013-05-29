# encoding: UTF-8

Given /^we have a lesson plan$/ do
  Lessonplan.create(
      [
          {
              title: 'Ruby on Rails Tutorial',
              content: "Some Content",
              short_description: 'Some Description',
              publisher_id: 1,
              created_at: 1.year.ago
          }
      ]
  )
end

And /^I am on the index page$/ do
  visit "/"
end

When /^I view that lesson plan$/ do
  page.should have_content '新的课堂，你来设计'
  page.find('.enter').click
end

Then /^the lesson page should be displayed$/ do
  find("h2").should have_content 'Ruby on Rails Tutorial'
end