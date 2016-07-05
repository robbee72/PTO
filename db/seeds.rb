require 'random_data'


# Create an admin user
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'password',
   role:     'admin'
 )

 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'password',
   role:     'member'
 )

 user = User.first
  user.update_attributes!(
    email: 'krobnson@gmail.com', # replace this with your personal email
    password: 'helloworld'
  )

 puts "Seed finished"
 #puts "#{Post.count} posts created"
 #puts "#{Comment.count} comments created"
 puts "#{User.count} user created"
