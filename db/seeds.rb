# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Publisher.create(
    [
        {
            email: 'openclass@gmail.com',
            alternative_name: 'openclass',
            password:'c8837b23ff8aaa8a2dde915473ce0991'
        }
    ]
)

Lessonplan.create(
    [
        {
          title: 'Ruby on Rails Tutorial',
          content: "The Ruby on Rails Tutorial owes a lot to my previous Rails book, RailsSpace, and hence to my coauthor Aurelius Prochazka. ",
          short_description: 'Learn Web Development with Rails',
          publisher_id: 1,
          created_at: 1.year.ago
        }
    ]
)

