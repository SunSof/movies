# rating creation
def star_rating(num)
  '*' * (num * 10 - 80)
end

# reading files
# sorting
def find_movie(movie_name, file_name: 'movies.txt')
  unless file_name == 'movies.txt'
    review_file = File.open(file_name)
    lines = review_file.readlines
    lines.each_with_object([]) do |el, acc|
      words = el.split('|')
      acc.push(words[1] + ' ' + star_rating(words[7].to_f) + ' ' + file_name) if words[1].include?(movie_name) == true
    end
  end
end

# p star_rating(9.6)
# p find_movie("Eve")
# p star_rating
