# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u = User.create(name: "Anonymous", email: "anonymous@testing.com", password: "anonymous")

Entity.create(name: "Test", amount: 300, user: u)
t1 = Entity.create(name: "Test1", amount: 100, user: u)
t2 = Entity.create(name: "Test2", amount: 200, user: u)
t3 = Entity.create(name: "Test3", amount: 300, user: u)
t4 = Entity.create(name: "Test4", amount: 400, user: u)

EntityGroup.create(entity: t1, group: u.groups.first)
EntityGroup.create(entity: t2, group: u.groups.first)
EntityGroup.create(entity: t4, group: u.groups.first)

EntityGroup.create(entity: t2, group: u.groups.last)
EntityGroup.create(entity: t3, group: u.groups.last)