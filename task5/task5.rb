require 'csv'

#5.1
class Movie 
    def movie_hash(file_name: 'movies.txt')
      hash_keys = %w[links title year country date genre time rating directors actors]
      CSV.parse(File.read(file_name), col_sep: '|', headers: hash_keys).map(&:to_h)
    end
  end
 

  class MovieCollection < Movie
    
  end


  movies = Movie.new()
  movie_collection = MovieCollection.new()
  movie_collection.movie_hash