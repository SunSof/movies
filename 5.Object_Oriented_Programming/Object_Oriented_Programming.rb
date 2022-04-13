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
      # make symbol
      hash = el.to_h.transform_keys(&:to_sym)
      Movie.new(hash)
    end
  end

  def initialize(file_name)
    @collection = movies_parse(file_name)
  end

  # 5.2.2
  def all
    @collection
  end

  # 5.2.3
  # guard clauses
  # (&field)
  def movie_sort(field)
    return raise 'Wrong argument' unless all[0].respond_to?(field)

    all.sort_by { |el|  el.send(field) }
  end

  # 5.2.4
  def movie_filter(field)
    key = field.keys[0]
    value = field.values[0]
    return raise 'Wrong argument' unless all[0].respond_to?(key)

    all.filter { |el| el.send(key).include?(value) }
  end

  # 5.2.5
  def movie_stats(field)
    hash = Hash.new(0)
    return raise 'Wrong argument' unless all[0].respond_to?(field)
    all.map do |el|
      hash[el.send(field)] += 1
    end
    hash
  end
end

movie_collection = MovieCollection.new('movies.txt')
# p movie_collection.movie_sort(:date)
# p movie_collection.movie_filter(genre: "Comedy")
# p movie_collection.movie_stats(:year)
