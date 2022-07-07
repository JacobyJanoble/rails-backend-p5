require 'faker'

puts "Seeding Users..."

User.create(username: 'jacoby', password_digest: '1234', email: "Jacob.McCann214@gmail.com")
User.create(username: 'abc123', password_digest: '1234', email: "creation01@gmail.com")
User.create(username: 'droid33', password_digest: '1234', email: "creation02@gmail.com")
User.create(username: 'dexter1', password_digest: '1234', email: "creation03@gmail.com")
User.create(username: 'jahmean99', password_digest: '1234', email: "creation04@gmail.com")
User.create(username: 'lab2', password_digest: '1234', email: "creation05@gmail.com")

puts "Done Seeding Users!"




puts "Seeding Channels..."

r_slash_interesting = Channel.create(title:"Damnthatsinteresting", description: "The most interesting place on reddit")
r_slash_comebacks = Channel.create(title:"clevercomebacks", description: "A place for great retorts. If someone just got shown up, this is the place to post it.")
r_slash_coding = Channel.create(title:"coding", description: "Welcome to coding")
r_slash_texas = Channel.create(title:"Texas", description: "News, events, and general noise related to the great state of Texas!")
r_slash_adhdmeme = Channel.create(title:"Adhdmemes", description: "ADHD memes, rage comics, and other nonsense")
r_slash_whatisthisthing = Channel.create(title:"Whatisthisthing", description: "If you have an object and you don't know what it is, this is the place for you to search for an answer. We may not know the why but we can help with the what.")
r_slash_reactjs = Channel.create(title:"Reactjs", description: "A community for learning and developing web applications using React by Facebook.")
r_slash_ruby = Channel.create(title:"Ruby", description: "Celebrate the weird and wonderful Ruby programming language with us!")

puts "Done Seeding Channels!"






puts "Seeding Channel Owners..."

u1_owner = ChannelOwner.create(user_id: u1.id, channel_id: r_slash_coding.id)
u1_owner = ChannelOwner.create(user_id: u1.id, channel_id: r_slash_reactjs.id)
u2_owner = ChannelOwner.create(user_id: u2.id, channel_id: r_slash_whatisthisthing.id)
u3_owner = ChannelOwner.create(user_id: u3.id, channel_id: r_slash_ruby.id)
u4_owner = ChannelOwner.create(user_id: u4.id, channel_id: r_slash_adhdmeme.id)
u5_owner = ChannelOwner.create(user_id: u5.id, channel_id: r_slash_comebacks.id)
u5_owner = ChannelOwner.create(user_id: u5.id, channel_id: r_slash_texas.id)
u6_owner = ChannelOwner.create(user_id: u6.id, channel_id: r_slash_interesting.id)

puts "Done Seeding Channel Owners!"




puts "Seeding Channel Members..."

# 5.times do
#     ChannelMember.create(
#         user_id: User.all.sample
#         channel_id: r_slash_coding.id
#     )
# end




# u1_code_member = ChannelMember.create(user_id: u1.id, channel_id: r_slash_coding.id)
# u4_code_member = ChannelMember.create(user_id: u4.id, channel_id: r_slash_coding.id)
# u5_code_member = ChannelMember.create(user_id: u5.id, channel_id: r_slash_coding.id)
# u6_code_member = ChannelMember.create(user_id: u6.id, channel_id: r_slash_coding.id)

# u1_interesting_member = ChannelMember.create(user_id: u1.id, channel_id: r_slash_interesting.id)
# u2_interesting_member = ChannelMember.create(user_id: u2.id, channel_id: r_slash_interesting.id)
# u3_interesting_member = ChannelMember.create(user_id: u3.id, channel_id: r_slash_interesting.id)
# u4_interesting_member = ChannelMember.create(user_id: u4.id, channel_id: r_slash_interesting.id)
# u5_interesting_member = ChannelMember.create(user_id: u5.id, channel_id: r_slash_interesting.id)
# u6_interesting_member = ChannelMember.create(user_id: u6.id, channel_id: r_slash_interesting.id)

# u2_comebacks_member = ChannelMember.create(user_id: u2.id, channel_id: r_slash_comebacks.id)
# u4_comebacks_member = ChannelMember.create(user_id: u4.id, channel_id: r_slash_comebacks.id)
# u5_comebacks_member = ChannelMember.create(user_id: u5.id, channel_id: r_slash_comebacks.id)

# u1_adhdmeme_member = ChannelMember.create(user_id: u1.id, channel_id: r_slash_adhdmeme.id)
# u6_adhdmeme_member = ChannelMember.create(user_id: u6.id, channel_id: r_slash_adhdmeme.id)

# u3_ruby_member = ChannelMember.create(user_id: u3.id, channel_id: r_slash_ruby.id)
# u4_ruby_member = ChannelMember.create(user_id: u4.id, channel_id: r_slash_ruby.id)
# u6_ruby_member = ChannelMember.create(user_id: u6.id, channel_id: r_slash_ruby.id)

# u1_reactjs_member = ChannelMember.create(user_id: u1.id, channel_id: r_slash_reactjs.id)
# u5_reactjs_member = ChannelMember.create(user_id: u5.id, channel_id: r_slash_reactjs.id)
# u4_reactjs_member = ChannelMember.create(user_id: u4.id, channel_id: r_slash_reactjs.id)
# u6_reactjs_member = ChannelMember.create(user_id: u6.id, channel_id: r_slash_reactjs.id)

# u3_whatsthis_member = ChannelMember.create(user_id: u3.id, channel_id: r_slash_whatisthisthing.id)
# u4_whatsthis_member = ChannelMember.create(user_id: u4.id, channel_id: r_slash_whatisthisthing.id)

# u5_texas_member = ChannelMember.create(user_id: u5.id, channel_id: r_slash_texas.id)
# u4_texas_member = ChannelMember.create(user_id: u4.id, channel_id: r_slash_texas.id)
# u2_texas_member = ChannelMember.create(user_id: u2.id, channel_id: r_slash_texas.id)

puts "Done Seeding Channel Members..."


puts "Seeding Posts and Replies..."

10.times do
    Post.create(
        title: Faker::Lorem.sentence(word_count: 7),
        content: Faker::Lorem.sentence(word_count: 15, supplemental: true, random_words_to_add: 10),
        user_id: User.all.sample,
        postable_id: Channel.all.sample
    )

    rand(1..7).times do
        Post.create(
            content: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 20),
            user_id: User.all.sample,
            postable_id: Post.all.sample
        )
    end
end

    # need to find a way to connect my replies to my posts...


# post1 = Post.create(title: 'How do you center a div?', content: Faker::Lorem.sentence(word_count: 5), user_id: u1.id, postable_id:r_slash_coding)

# # post1 = Post.create(title: 'How do you center a div?', content: Faker::Lorem.sentence(word_count: 5), user_id: u1.id, postable: :r_slash_coding)


# reply1_2 = Post.create(content: Faker::Lorem.sentence(word_count: 2), user_id: u1.id, postable_id: post1)
# reply1_3 = Post.create(content: Faker::Lorem.sentence(word_count: 1), user_id: u3.id, postable_id: reply1_2)


# post2 = Post.create(title: 'What is the coolest coding project you have ever worked on?', content:'lmk', user_id: u5.id, postable_id:r_slash_coding)

# reply2 = Post.create(content: Faker::Lorem.sentence(word_count: 13), user_id: u3.id, postable_id: post2)
# reply2_2 = Post.create(content:Faker::Lorem.sentence(word_count: 7), user_id: u1.id, postable_id: reply2)


# post3 = Post.create(title: 'Texas is great', content:Faker::Lorem.sentence(word_count: 4), user_id: u4.id, postable_id:r_slash_texas)

# post4 = Post.create(title: 'Tell me something interesting!', content: Faker::Lorem.sentence(word_count: 13), user_id: u1.id, postable_id:r_slash_interesting)

# post5 = Post.create(title: 'Axos library?', content:Faker::Lorem.sentence(word_count: 17), user_id: u5.id, postable_id:r_slash_reactjs)

# post6 = Post.create(title: 'What is this?', content:Faker::Lorem.sentence(word_count: 6), user_id: u3.id, postable_id:r_slash_whatisthisthing)

# post7 = Post.create(title: 'What is the most relatable thing about having ADHD?', content:Faker::Lorem.sentence(word_count: 21), user_id: u3.id, postable_id: r_slash_adhdmeme)
# reply7_1 = Post.create(content: Faker::Lorem.sentence(word_count: 33), user_id: u1.id, postable_id: post7)

# post8 = Post.create(title: 'Want to hear a ruby joke?', content: Faker::Lorem.sentence(word_count: 3), user_id: u6.id, postable_id:r_slash_ruby)

puts "Done Seeding Posts And Replies..."

# like1 = Like.create(user_id: u1.id, post_id: post1.id)
# like2 = Like.create(user_id: u1.id, post_id: reply1_2.id)
# like3 = Like.create(user_id: u5.id, post_id: post2.id)
# like4 = Like.create(user_id: u5.id, post_id: reply2.id)
# like5 = Like.create(user_id: u5.id, post_id: reply2_2.id)
# like6 = Like.create(user_id: u2.id, post_id: post8.id)

rand(1..100).times do
    Like.create(
        user_id: User.all.sample
        post_id Post.all.sample
    )
end
