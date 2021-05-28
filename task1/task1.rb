def movie
  like = ["Matrix", "Bird", "Life"]
  name = ARGV[0]
  if like.include? (name)
    puts "It is a good movie"
  elsif  ARGV.include? 'Titanic'
    puts "Titanic is a bad movie"
  else 
    puts "Haven't seen #{name} yet"
  end
end


movie

