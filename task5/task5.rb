require 'csv'

# 5.1
# class MovieCollection
#   def all(file_name)
#     hash_keys = %w[links title year country date genre time rating directors actors]
#     CSV.parse(File.read(file_name), col_sep: '|', headers: hash_keys).map(&:to_h)
#   end
# end

# movie_collection = MovieCollection.new
# p movie_collection.all("movies.txt")

class Movie
  def initialize(hash)
    @links = hash[:links]
    @title = hash[:title]
    @year = hash[:year]
    @country = hash[:country]
    @date = hash[:date]
    @genre = hash[:genre]
    @time = hash[:time]
    @rating = hash[:rating]
    @directors = hash[:directors]
    @actors = hash[:actors]
  end
end

class MovieCollection
  attr_accessor :file_name

  def movies_parse(file_name)
    hash_keys = %w[links title year country date genre time rating directors actors]
    CSV.parse(File.read(file_name), col_sep: '|', headers: hash_keys).map do |el|
      hash = el.to_h.transform_keys(&:to_sym)
      Movie.new(hash)
    end
  end

  def initialize(file_name)
    @file_name = file_name
    @collection = movies_parse(file_name)
  end

  def all
    @collection
  end
end

movie_collection = MovieCollection.new('movies.txt')
p movie_collection.all
