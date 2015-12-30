# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include RandomData
include AdTest

#create posts
50.times do
  Post.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

#ad test data here
#Advertisement.create!(
#  title: AdTest.adtitle,
#  copy: AdTest.adcopy,
#  price: AdTest.adprice
#  )

#  create ads
  50.times do
    Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: 1
    )
  end

  advertisement = Advertisement.all

  puts "Seed for Ads finished"
  puts "#{Advertisement.count} ads created"

#advertisements = Advertisements.all
