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
    password { Digest::MD5.hexdigest "123123" }
  end

end

