# def splitWords
#   review_file = File.open("movies.txt")
#   lines = review_file.readlines
#   lines.reduce([]) do |acc, el|
#     splitWords = el.split('|')
#     if splitWords[1].include?("Max") == true
#       acc.push(splitWords[1] + " " + splitWords[7])
#     end
#     acc  
#   end
# end
# p splitWords


# def star_rating(num)  
#   "*"*(num*10-80)
#  end  

#  def find_movie(movie_name, file_name: "movies.txt")
#   review_file = File.open("movies.txt")
#   lines = review_file.readlines
#   lines.reduce([]) do |acc, el|
#     words = el.split('|')
#     if words[1].include?(movie_name) == true
#       acc.push(words[1] + " " + star_rating(words[7].to_f) + " " + file_name)
#     end
#     acc  
#   end
# end




# # p star_rating(9.6)
# p find_movie("Eve")
# # p star_rating
  

def star_rating(num)  
  "*"*(num*10-80)
 end  

 def find_movie(movie_name, file_name: "movies.txt") 
  unless file_name == "movies.txt"
    review_file = File.open(file_name)
    lines = review_file.readlines
    lines.reduce([]) do |acc, el|
      words = el.split('|')
      if words[1].include?(movie_name) == true
        acc.push(words[1] + " " + star_rating(words[7].to_f) + " " + file_name)
      end
      acc  
    end
  end
end




# p star_rating(9.6)
p find_movie("Eve")
# p star_rating
  