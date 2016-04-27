# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Test comment for commit
r1 = Role.create({name: "Survivor", description: "Can create converstations and create and read messages"})
r2 = Role.create({name: "Volunteer", description: "Can create messages and read any conversations"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id, online: true})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id, online: true})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id, online: true})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id, online: true})

# initialize a bad conversation between Survivor Sally and Volunteer Kev for development purposes (see admin dashboard UI)
c1 = Conversation.create({sender_id: u1.id, recipient_id: u3.id})
m1a = Message.create({body: "poop", conversation_id: c1.id, user_id: u3.id})
m1b = Message.create({body: "pewp", conversation_id: c1.id, user_id: u1.id})
s1 = Survey.create({rating: 1, text: "I did not have a good conversation.", conversation_id: c1.id})

# another bad conversation 
c2 = Conversation.create({sender_id: u1.id, recipient_id: u2.id})
s2 = Survey.create({rating: 2, text: "this conversation was below average", conversation_id: c2.id})