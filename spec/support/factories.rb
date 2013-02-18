FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@appele.com"
  end

  factory :user do |u|
    sequence(:unique_id) { |n| "User#{n}"}
    sequence(:nick_name) { |n| "nick_name#{nick_name}" }
    sequence(:avatar_url) { |n| "http://xx.xx/#{n}.png" }
  end

  factory :publisher do |p|
    email
    sequence(:alternative_name) { |n| "alternative_name#{n}" }
    sequence(:short_description) { |n| "short_description#{n}" }
    password { "123123" }
  end

  factory :lessonplan do |l|
    sequence(:title) { |n| "lessplan title#{n}" }
    sequence(:content) { |n| "lessplan content#{n}" }
    sequence(:short_description) { |n| "lessplan short_description#{n}" }
    publisher
  end

  factory :task do |t|
    sequence(:title) { |n| "task title#{n}" }
    sequence(:content) { |n| "task content#{n}" }
    lessonplan
  end

  factory :comment do |t|
    sequence(:content) { |n| "comment content #{n}" }
    lessonplan
    publisher
  end

end

