# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Subject.destroy_all
Review.destroy_all
Vote.destroy_all

User.reset_pk_sequence
Subject.reset_pk_sequence
Review.reset_pk_sequence
Vote.reset_pk_sequence



# Users:
user1 = User.create(username: "razajafri")
user2 = User.create(username: "derickcastillo")
user3 = User.create(username: "ethandavidson")
user4 = User.create(username: "yusufcelep")
user5 = User.create(username: "adamshaffer")
user6 = User.create(username: "ellisandrews")
user7 = User.create(username: "jasonmelton")
user8 = User.create(username: "davideber")
user9 = User.create(username: "jackoverby")
user10 = User.create(username: "mikepottebaum")


# Subjects:
subject1 = Subject.create(description: "Education", category: "Coding")
subject2 = Subject.create(description: "Entertainment", category: "Gaming")
subject3 = Subject.create(description: "Entertainment", category: "Television")
subject4 = Subject.create(description: "Entertainment", category: "Movies")
subject5 = Subject.create(description: "Comedy", category: "Humor")
subject6 = Subject.create(description: "Lifestyle", category: "News and Issues")
subject7 = Subject.create(description: "Entertainment", category: "Sports")
subject8 = Subject.create(description: "Entertainment", category: "Technology")
subject9 = Subject.create(description: "Entertainment", category: "Music")
subject10 = Subject.create(description: "Lifestyle", category: "Psychology")


# Reviews:
review1 = Review.create(content: "Programming is not a personality trait.", subject_id: 1, user_id: 1)
review2 = Review.create(content: "COBOL really picked up during this crisis.", subject_id: 1, user_id: 2)
review3 = Review.create(content: "AI is just a bunch of if/else statements, don't hate the player, hate the game.", subject_id: 1, user_id: 3)
review4 = Review.create(content: "Animal Crossing: New Horizons just came out!", subject_id: 2, user_id: 4)
review5 = Review.create(content: "Nintendo Switch is trying to stop sales of its console.", subject_id: 2, user_id: 5)
review6 = Review.create(content: "PC is better than Console.", subject_id: 2, user_id: 6)
review7 = Review.create(content: "Is the Tiger King trend still on?", subject_id: 3, user_id: )
review8 = Review.create(content: "I just finished Dexter and it was Marvelous!", subject_id: 3, user_id: 7)
review9 = Review.create(content: "Should I start The Sopranos?", subject_id: 3, user_id: 8)
review10 = Review.create(content: "I've a sudden urge to have a Studio Ghibli marathon.", subject_id: 4, user_id: 9)
review11 = Review.create(content: "A lot of movies are getting pushed back :(", subject_id: 4, user_id: 10)
review12 = Review.create(content: "Parasite was surprisingly pretty good, I liked it.", subject_id: 4, user_id: 1)
review13 = Review.create(content: "", subject_id: 5, user_id: )
review14 = Review.create(content: "", subject_id: 5, user_id: )
review15 = Review.create(content: "", subject_id: 5, user_id: )
review16 = Review.create(content: "", subject_id: 6, user_id: )
review17 = Review.create(content: "", subject_id: 6, user_id: )
review18 = Review.create(content: "", subject_id: 6, user_id: )
review19 = Review.create(content: "", subject_id: 7, user_id: )
review20 = Review.create(content: "", subject_id: 7, user_id: )
review21 = Review.create(content: "", subject_id: 7, user_id: )
review22 = Review.create(content: "", subject_id: 8, user_id: )
review23 = Review.create(content: "", subject_id: 8, user_id: )
review24 = Review.create(content: "", subject_id: 8, user_id: )
review25 = Review.create(content: "", subject_id: 9, user_id: )
review26 = Review.create(content: "", subject_id: 9, user_id: )
review27 = Review.create(content: "", subject_id: 9, user_id: )
review28 = Review.create(content: "", subject_id: 10, user_id: )
review29 = Review.create(content: "", subject_id: 10, user_id: )
review30 = Review.create(content: "", subject_id: 10, user_id: )


# Votes:
vote1 = Vote.create(review_id: 2, user_id: 1, sentiment: -1)
vote2 = Vote.create(review_id: 3, user_id: 1, sentiment: 1)
vote3 = Vote.create(review_id: 4, user_id: 1, sentiment: 1)
vote4 = Vote.create(review_id: 5, user_id: 1, sentiment: 1)
vote5 = Vote.create(review_id: 6, user_id: 1, sentiment: -1)
vote6 = Vote.create(review_id: 1, user_id: 2, sentiment: -1)
vote7 = Vote.create(review_id: 7, user_id: 2, sentiment: 1)
vote8 = Vote.create(review_id: 8, user_id: 2, sentiment: -1)
vote9 = Vote.create(review_id: 9, user_id: 2, sentiment: 1)
vote10 = Vote.create(review_id: 10, user_id: 2, sentiment: 1)
vote11 = Vote.create(review_id: 11, user_id: 3, sentiment: 1)
vote12 = Vote.create(review_id: 12, user_id: 3, sentiment: 1)
vote13 = Vote.create(review_id: , user_id: 3, sentiment: -1)
vote14 = Vote.create(review_id: , user_id: 3, sentiment: 1)
vote15 = Vote.create(review_id: , user_id: 3, sentiment: -1)
vote16 = Vote.create(review_id: , user_id: 4, sentiment: 1)
vote17 = Vote.create(review_id: , user_id: 4, sentiment: 1)
vote18 = Vote.create(review_id: , user_id: 4, sentiment: 1)
vote19 = Vote.create(review_id: , user_id: 4, sentiment: 1)
vote20 = Vote.create(review_id: , user_id: 4, sentiment: 1)
vote21 = Vote.create(review_id: , user_id: 5, sentiment: -1)
vote22 = Vote.create(review_id: , user_id: 5, sentiment: 1)
vote23 = Vote.create(review_id: , user_id: 5, sentiment: 1)
vote24 = Vote.create(review_id: , user_id: 5, sentiment: 1)
vote25 = Vote.create(review_id: , user_id: 5, sentiment: -1)
vote26 = Vote.create(review_id: , user_id: 6, sentiment: -1)
vote27 = Vote.create(review_id: , user_id: 6, sentiment: 1)
vote28 = Vote.create(review_id: , user_id: 6, sentiment: -1)
vote29 = Vote.create(review_id: , user_id: 6, sentiment: 1)
vote30 = Vote.create(review_id: , user_id: 6, sentiment: 1)
vote31 = Vote.create(review_id: , user_id: 7, sentiment: 1)
vote32 = Vote.create(review_id: , user_id: 7, sentiment: -1)
vote33 = Vote.create(review_id: , user_id: 7, sentiment: 1)
vote34 = Vote.create(review_id: , user_id: 7, sentiment: -1)
vote35 = Vote.create(review_id: , user_id: 7, sentiment: 1)
vote36 = Vote.create(review_id: , user_id: 8, sentiment: 1)
vote37 = Vote.create(review_id: , user_id: 8, sentiment: 1)
vote38 = Vote.create(review_id: , user_id: 8, sentiment: 1)
vote39 = Vote.create(review_id: , user_id: 8, sentiment: -1)
vote40 = Vote.create(review_id: , user_id: 8, sentiment: 1)
vote41 = Vote.create(review_id: , user_id: 9, sentiment: 1)
vote42 = Vote.create(review_id: , user_id: 9, sentiment: 1)
vote43 = Vote.create(review_id: , user_id: 9, sentiment: 1)
vote44 = Vote.create(review_id: , user_id: 9, sentiment: -1)
vote45 = Vote.create(review_id: , user_id: 9, sentiment: -1)
vote46 = Vote.create(review_id: , user_id: 10, sentiment: 1)
vote47 = Vote.create(review_id: , user_id: 10, sentiment: -1)
vote48 = Vote.create(review_id: , user_id: 10, sentiment: -1)
vote49 = Vote.create(review_id: , user_id: 10, sentiment: 1)
vote50 = Vote.create(review_id: , user_id: 10, sentiment: 1)