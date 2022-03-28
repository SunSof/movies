require 'csv'
require 'ostruct'
require 'date'

# 4.1
def movie_hash(file_name: 'movies.txt')
  hash_keys = %w[links title year country date genre time rating directors actors]
  CSV.parse(File.read(file_name), col_sep: '|', headers: hash_keys).map(&:to_h)
end

# 4.2
def film_collection(movies)
  movies.map { |row| OpenStruct.new(row) }
end
data = film_collection(movie_hash)

def longest_movies(collection)
  collection
    .sort_by { |el| el.time.to_i }
    .last
end

def sort_by_release_date(collection)
  collection.sort_by { |el| el.date.to_i }
end

def select_by_genre(collection, genre)
  if genre.nil?
    collection
  else
    collection.filter do |el|
      el
        .genre
        .split(',')
        .include?(genre)
    end
  end
end

def select_movies(movies, genre = nil, num = 1)
  movies
    .then { |movies| select_by_genre(movies, genre) }
    .then { |movies| sort_by_release_date(movies) }
    .then { |movies| movies.first(num) }
end

def get_directors(movies)
  movies.reduce([]) do |acc, el|
    elem = el
           .directors
           .split(' ')
           .last
    acc.push(elem)
    acc.uniq.sort! { |a, b| a <=> b }
  end
end

def get_country(movies, country)
  movies
    .reject do |el|
      el
        .country
        .split(' ')
        .include?(country)
    end
    .count
end

def get_output(movies)
  movies.map do |el|
    title = el.title
    date = el.date
    genre = el.genre.gsub(',', '/')
    time = el.time
    "#{title} (#{date}; #{genre}) - #{time}"
  end
end

# 4.3
def statistic_movies_per_month(movies)
  months = movies.map do |el|
    date_in_arr = el.date.scan(/\d+/)
    year = date_in_arr[0].to_i
    month = (date_in_arr[1] || '01').to_i
    day =  (date_in_arr[2] || '01').to_i
    data = Date.new(year, month, day)
    data.month
  end
  months_hash = { 1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July',
                  8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December' }
  months.sort.each_with_object(Hash.new(0)) do |element, hash|
    month = months_hash[element]
    hash[month] = hash[month] + 1
  end
end
