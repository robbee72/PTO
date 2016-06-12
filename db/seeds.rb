require 'random_data'
#
# 5.times do
# # #1
#   Employees.create!(
# # #2
#     name:  RandomData.random_sentence,
#     email:   RandomData.random_paragraph
#   )
# end
# employees = Employee.all

 # 5.times do
 # # #1
 #   Post.create!(
 # # #2
 #     title:  RandomData.random_sentence,
 #     body:   RandomData.random_paragraph
 #   )
 # end
 # posts = Post.all
 #
 # 10.times do
 #   Comment.create!(
 # # #4
 #     post: posts.sample,
 #     body: RandomData.random_paragraph
 #   )
 # end

 puts "Seed finished"
 # puts "#{Post.count} posts created"
 # puts "#{Comment.count} comments created"
 puts "#{Employee.count} employee created"
