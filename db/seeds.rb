# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Move those to application.yml from figaro
#categories = %w[news services personal diary]
#categories.each do |category|
#  Category.create(name: category)
#end


roles = %w[admin moderator author user]
roles.each do |role|
  Role.create(name: role)
end

users = %w[admin@gmail.com moderator@gmail.com author@gmail.com user@gmail.com]
users.each do |user|
  User.create(email: user, name: user, password: "12345678", password_confirmation: "12345678")
end



StaticPage.create(title: "About us", content: "Choo chooo!")
StaticPage.create(title: "Services", content: "Choo chooo!")

NodeType.create(name: "Show a static page", controller: "static_pages", action: "show")
NodeType.create(name: "Show contact page", controller: "contact_pages", action: "show")
NodeType.create(name: "Display all articles", controller: "articles", action: "index")
NodeType.create(name: "Show a media gallery", controller: "media_galleries", action: "show")
NodeType.create(name: "Display home page", controller: "welcome", action: "index")
NodeType.create(name: "All categories", controller: "categories", action: "index")

Menu.create(name: "Main menu", position: 1)

20.times do
  data = {
    title: Faker::Lorem.sentences(1).join,
    preview: Faker::Lorem.sentences(1).join,
    content: Faker::Lorem.sentences(40).join,
    published: true
  }
  article = Article.new(data)
  article.user_id = User.first.id
  article.categories = Category.all
  article.save
end