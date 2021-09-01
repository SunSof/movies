# def conver_to_hash(file_name: "movies.txt")
#   review_file = File.open(file_name) # open file
#   lines = review_file.readlines  # divide into lines
#   lines.reduce([]) do |acc, el|  
#      words = el.split('|') # split words in the line
#      hash = {links: words[0], title: words[1], year: words[2], country: words[3], date: words[4], genre: words[5], time: words[6], rating: words[7], producer: words[8], actors: words[9]}
#       p hash
#   end
  
# end 
# p conver_to_hash

#1.1
def movie_hash(file_name: "movies.txt")
  review_file = File.open(file_name) # open file
  lines = review_file.readlines  # divide into lines
  lines.reduce([]) do |acc, el|  
     words = el.split('|') # split words in the line
     hash_keys = ["links", "title", "year", "country", "date", "genre", "time", "rating", "directors", "actors"] # create array of keys
     hash = hash_keys.zip(words).to_h # method "zip" concatenate arrays, "to_hash" make hash    
     acc.push(hash)
     acc
  end
end 

# def find_max_num
#   convert_to_hash.reduce([]) do |acc,el| 
#   time = el.fetch("time").to_i
#     acc.push(time)
#     acc.max(5)
#   end 
# end 

#2.1
def longest_movies(movies, num) 
  sort_movie = movies.sort_by do |el| #call the function passed in the argument, "sort_by" enumerable  
    el["time"].to_i # take an element with a key "time" and make a number out of it
  end 
  sort_movie.last(num) # all sorted items. take the latter el by the number of arguments
end 

#2.2
def sort_by_release_date(movies)
  #call the function passed in the argument, "sort_by" enumerable  
  movies.sort_by do |el| 
    # take an element with a key "date" and make a number out of it 
    el["date"].to_i  
  end
end

def select_by_genre(movies, genre) 
  if genre == nil
    movies
  else 
    movies.filter do |el|
      # get an array
      el["genre"].split(",").include?(genre)
    end 
  end  
end

def select_movies(movies, genre = nil, num = 1)
  movies
  .then {|movies| select_by_genre(movies, genre)}
  .then {|movies| sort_by_release_date(movies)}
  .then {|movies| movies.first(num)}
end

#2.3
def get_directors(movies)
  movies.reduce([]) do |acc, el|  
    elem = el["directors"].split(" ").last
    acc.push(elem)
    # sort alphabetically without repeats
    acc.uniq.sort! { |a, b| a <=> b }
  end
end

#2.4  посчитать количество  
def get_country(movies, country)
  movies.reject do |el| 
    el["country"].split(" ").include?(country)
  end
end

#3 сделать палочку вместо запятой 
def get_output(movies)
  movies.map do |el|
    title = el["title"]
    date = el["date"]
    genre = el["genre"]
    time = el["time"]
    "#{title} (#{date}; #{genre}) - #{time}"
    end   
end

# get_output(movie_hash)
p  get_country(movie_hash, "USA")
# p getting_directors(movie_hash)

# sort_by_release_date(movie_hash)
# select_movies(movie_hash, "Comedy", 10)
#  select_by_genre(movie_hash, "Comedy")

# longest_movies(movie_hash, 5)

