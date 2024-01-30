# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Studio.destroy_all
Character.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# COMPLETED IN db/migrate folder

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#ADD STUDIOS
studio1 = Studio.new
    studio1["name"] = "Warner Bros."
studio1.save

# WARNER BROS FOREIGN KEY
warner_bros = Studio.find_by({"name" => "Warner Bros."})

# ADD MOVIES

movie1 = Movie.new
    movie1["title"] = "Batman Begins"
    movie1["year_released"] = "2005"
    movie1["MPAA_rating"] = "PG-13"
    movie1["studio_id"] = warner_bros["id"]
movie1.save

movie2 = Movie.new
    movie2["title"] = "The Dark Knight"
    movie2["year_released"] = "2008"
    movie2["MPAA_rating"] = "PG-13"
    movie2["studio_id"] = warner_bros["id"]
movie2.save

movie3 = Movie.new
    movie3["title"] = "The Dark Knight Rises"
    movie3["year_released"] = "2012"
    movie3["MPAA_rating"] = "PG-13"
    movie3["studio_id"] = warner_bros["id"]
movie3.save

# ADD ACTORS

actor1 = Actor.new
    actor1["name"] = "Christian Bale"
actor1.save

actor2 = Actor.new
    actor2["name"] = "Michael Cane"
actor2.save

actor3 = Actor.new
    actor3["name"] = "Liam Neeson"
actor3.save

actor4 = Actor.new
    actor4["name"] = "Katie Holmes"
actor4.save

actor5 = Actor.new
    actor5["name"] = "Heath Ledger"
actor5.save

actor6 = Actor.new
    actor6["name"] = "Aaron Eckhart"
actor6.save

actor7 = Actor.new
    actor7["name"] = "Maggie Gyllenhaal"
actor7.save

actor8 = Actor.new
    actor8["name"] = "Gary Oldman"
actor8.save

actor9 = Actor.new
    actor9["name"] = "Tom Hardy"
actor9.save

actor10 = Actor.new
    actor10["name"] = "Joseph Gordon-Levitt"
actor10.save

actor11 = Actor.new
    actor11["name"] = "Anne Hathaway"
actor11.save

# MOVIE FOREIGN KEYS

batman_begins = Movie.find_by({"title" => "Batman Begins"})
dark_knight = Movie.find_by({"title" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})

# ACTOR FOREIGN KEYS

christian_bale = Actor.find_by({"name" => "Christian Bale"})
michael_cane = Actor.find_by({"name" => "Michael Cane"})
liam_neeson = Actor.find_by({"name" => "Liam Neeson"})
katie_holmes = Actor.find_by({"name" => "Katie Holmes"})
heath_ledger = Actor.find_by({"name" => "Heath Ledger"})
aaron_eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
maggie_gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})
tom_hardy = Actor.find_by({"name" => "Tom Hardy"})
joseph_gl = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
anne_hathaway = Actor.find_by({"name" => "Anne Hathaway"})

#CREATE CHARACTERS

character1 = Character.new
    character1["name"] = "Bruce Wayne"
    character1["movie_id"] = batman_begins["id"]
    character1["actor_id"] = christian_bale["id"]
character1.save

character2 = Character.new
    character2["name"] = "Alfred"
    character2["movie_id"] = batman_begins["id"]
    character2["actor_id"] = michael_cane["id"]
character2.save

character3 = Character.new
    character3["name"] = "Ra's Al Ghul"
    character3["movie_id"] = batman_begins["id"]
    character3["actor_id"] = liam_neeson["id"]
character3.save

character4 = Character.new
    character4["name"] = "Rachel Dawes"
    character4["movie_id"] = batman_begins["id"]
    character4["actor_id"] = katie_holmes["id"]
character4.save

character5 = Character.new
    character5["name"] = "Commissioner Gordon"
    character5["movie_id"] = batman_begins["id"]
    character5["actor_id"] = gary_oldman["id"]
character5.save

character6 = Character.new
    character6["name"] = "Bruce Wayne"
    character6["movie_id"] = dark_knight["id"]
    character6["actor_id"] = christian_bale["id"]
character6.save

character7 = Character.new
    character7["name"] = "Joker"
    character7["movie_id"] = dark_knight["id"]
    character7["actor_id"] = heath_ledger["id"]
character7.save

character8 = Character.new
    character8["name"] = "Harvey Dent"
    character8["movie_id"] = dark_knight["id"]
    character8["actor_id"] = aaron_eckhart["id"]
character8.save

character10 = Character.new
    character10["name"] = "Alfred"
    character10["movie_id"] = dark_knight["id"]
    character10["actor_id"] = michael_cane["id"]
character10.save

character11 = Character.new
    character11["name"] = "Rachel Dawes"
    character11["movie_id"] = dark_knight["id"]
    character11["actor_id"] = maggie_gyllenhaal["id"]
character11.save

character12 = Character.new
    character12["name"] = "Bruce Wayne"
    character12["movie_id"] = dark_knight_rises["id"]
    character12["actor_id"] = christian_bale["id"]
character12.save

character13 = Character.new
    character13["name"] = "Commissioner Gordon"
    character13["movie_id"] = dark_knight_rises["id"]
    character13["actor_id"] = gary_oldman["id"]
character13.save

character14 = Character.new
    character14["name"] = "Bane"
    character14["movie_id"] = dark_knight_rises["id"]
    character14["actor_id"] = tom_hardy["id"]
character14.save

character15 = Character.new
    character15["name"] = "John Blake"
    character15["movie_id"] = dark_knight_rises["id"]
    character15["actor_id"] = joseph_gl["id"]
character15.save

character16 = Character.new
    character16["name"] = "Selina Kyle"
    character16["movie_id"] = dark_knight_rises["id"]
    character16["actor_id"] = anne_hathaway["id"]
character16.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all

for movie in movies
# find each item and lookup associated studio name
  title = movie["title"]
  year = movie["year_released"]
  rating = movie["MPAA_rating"]
    studio_id = movie["studio_id"]
    studio_name = Studio.find_by({"id" => studio_id})
  studio = studio_name["name"]
  # display
  puts "#{title} #{year} #{rating} #{studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
characters = Character.all

for character in characters
# find associated actor and movie names
    movie_id = character["movie_id"]
    movie_name = Movie.find_by({"id" => movie_id})
title = movie_name["title"]
    actor_id = character["actor_id"]
    actor_name = Actor.find_by({"id" => actor_id})
actor = actor_name["name"]
role = character["name"]
  puts "#{title} #{actor} #{role}"
end