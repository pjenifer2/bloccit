# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include RandomData

#create posts
#50.times do
#  Post.create!(
#  title: RandomData.random_sentence,
#  body: RandomData.random_paragraph
#  )
#end

#posts = Post.all

#100.times do
#  Comment.create!(
#  post: posts.sample,
#  body: RandomData.random_paragraph
#  )
#end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Post.find_or_create_by(
title: "Star Wars the Force Awakens",
body: "Star Wars returns with it's seventh installment about good vs evil in a galaxy far far away"
)

Comment.find_or_create_by(
body: "A great movie"
)

#exercise does not state that the comment needs to be associated with the post.
#so I'm not going to do that... so ... this leads to more questions
#I image this exercise is for creating test data to help you code .. makes sense
#but then how do you associate the comment with the post ... this would be crtical
#in my opinion.
