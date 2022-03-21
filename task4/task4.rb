require 'csv'

# def movie_hash(file_name: "movies.txt")
#   review_file = CSV.read(file_name)
#   arr = []
#   CSV.foreach("movies.txt") do |row|
#     words = row.join(',').split('|')
#     hash_keys = ["links", "title", "year", "country", "date", "genre", "time", "rating", "directors", "actors"]
#     hash = hash_keys.zip(words).to_h
#     arr.push(hash)
#   end
#   arr
# end

def movie_hash(file_name: "movies.txt")
  hash_keys = ["links", "title", "year", "country", "date", "genre", "time", "rating", "directors", "actors"]
  CSV.parse(File.read(file_name), col_sep: "|", headers:hash_keys).map(&:to_h)   
end

p movie_hash(file_name: "movies.txt")
