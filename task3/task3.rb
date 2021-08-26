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

def longest_movies(movies, num) 
  sort_movie = movies.sort_by do |el| #call the function passed in the argument, "sort_by" enumerable  
    el["time"].to_i # take an element with a key "time" and make a number out of it
  end 
  sort_movie.last(num) # all sorted items. take the latter el by the number of arguments
end 


def sort_by_release_date(movies)
  movies.sort_by do |el|  #call the function passed in the argument, "sort_by" enumerable  
    el["date"].to_i  # take an element with a key "date" and make a number out of it
  end
end


def comedy_movies(movies)
  movies.reduce([]) do |acc, el|
    if el["genre"].include?("Comedy") # Does the item with the key "genre" have the word "comedy"?
      acc.push(el) # if yes, push in acc
    end 
    acc
  end  
end

def comedy_movies_sort_by_date_realease(movies, num)
  first_ten_movies = sort_by_release_date(movies).yield_self {|movies| comedy_movies(movies).first(num)} # use it as a series of function calls, return the final result
  first_ten_movies
end



def getting_directors(movies)
  movies.reduce([]) do |acc, el|  
    elem = el["directors"].split(" ").last
    acc.push(elem)
    acc.uniq.sort! { |a, b| a <=> b }
  end
end


p getting_directors(movie_hash)

# p comedy_movies_sort_by_date_realease(movie_hash, 10)

# sort_by_release_date(movie_hash)

# comedy_movies(movie_hash)

# longest_movies(movie_hash, 5)

