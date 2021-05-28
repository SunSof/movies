review_file = File.open("movies.txt")
lines = review_file.readlines.join().split('|')
p lines
review_file.close