# hash storage
# sorting, filtering
# informative output
# 1.1
def movie_hash(file_name: 'movies.txt')
  # open file
  review_file = File.open(file_name)
  # divide into lines
  lines = review_file.readlines
  lines.each_with_object([]) do |el, acc|
    # split words in the line
    words = el.split('|')
    # create array of keys
    hash_keys = %w[links title year country date genre time rating directors actors]
    # method "zip" concatenate arrays, "to_hash" make hash
    hash = hash_keys.zip(words).to_h
    acc.push(hash)
  end
end

# 2.1
def longest_movies(movies, num)
  # call the function passed in the argument, "sort_by" enumerable
  sort_movie = movies.sort_by do |el|
    # take an element with a key "time" and make a number out of it
    el['time'].to_i
  end
  # all sorted items. take the latter el by the number of arguments
  sort_movie.last(num)
end

# 2.2
def sort_by_release_date(movies)
  # call the function passed in the argument, "sort_by" enumerable
  movies.sort_by do |el|
    # take an element with a key "date" and make a number out of it
    el['date'].to_i
  end
end

def select_by_genre(movies, genre)
  if genre.nil?
    movies
  else
    movies.filter do |el|
      # get an array
      el['genre'].split(',').include?(genre)
    end
  end
end

def select_movies(movies, genre = nil, num = 1)
  movies
    .then { |movies| select_by_genre(movies, genre) }
    .then { |movies| sort_by_release_date(movies) }
    .then { |movies| movies.first(num) }
end

# 2.3
def get_directors(movies)
  movies.reduce([]) do |acc, el|
    elem = el['directors'].split(' ').last
    acc.push(elem)
    # sort alphabetically without repeats
    acc.uniq.sort! { |a, b| a <=> b }
  end
end

# 2.4
def get_country(movies, country)
  movies
    .reject do |el|
      el['country'].split(' ').include?(country)
    end
    .count
end

# 3
def get_output(movies)
  movies.map do |el|
    title = el['title']
    date = el['date']
    genre = el['genre'].gsub(',', '/')
    time = el['time']
    "#{title} (#{date}; #{genre}) - #{time}"
  end
end

#  get_output(movie_hash)
#  get_country(movie_hash, "USA")
# p getting_directors(movie_hash)

# sort_by_release_date(movie_hash)
# select_movies(movie_hash, "Comedy", 10)
#  select_by_genre(movie_hash, "Comedy")

# longest_movies(movie_hash, 5)
