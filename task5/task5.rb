require 'csv'

class Movie
  attr_reader :links, :title, :year, :country, :date, :genre, :time, :rating, :directors, :actors

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
  attr_accessor :colection

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

  def movie_sort(field)
    return raise 'Wrong argument' unless all[0].respond_to?(field)

    all.sort_by { |el|  el.send(field) }
  end

  # def movie_filter(fild)
  #    a = fild.keys
  #   all.filter {|el|  }
  # end
end

movie_collection = MovieCollection.new('movies.txt')
# p movie_collection.movie_sort(:date)
# movie_collection.movie_filter(genre: "Comedy")
