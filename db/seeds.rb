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
  User.create(email: user, password: "12345678", password_confirmation: "12345678")
end

User.find_by_email(users.first).roles << Role.find_by_name(roles.first)
User.find_by_email(users.first).roles << Role.find_by_name(roles.second)

User.find_by_email(users.second).roles << Role.find_by_name(roles.second)
User.find_by_email(users.third).roles << Role.find_by_name(roles.third)
User.find_by_email(users.fourth).roles << Role.find_by_name(roles.fourth)