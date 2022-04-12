def letter_count(word)
  y = Hash.new(0)
  word.split('').each do |letter|
    y[letter] += 1
  end
  y
end

def letter_count_with_if(word)
  y = {}
  word.split('').each do |letter|
    if y[letter]
      y[letter] += 1
    else
      y[letter] = 1
    end
  end
  y
end
# {:a => 1} {a: 1}

def letter_count_with_reduce(word)
  word.split('').each_with_object(Hash.new(0)) do |el, acc|
    acc[el] += 1
  end
end

# letter_count_with_reduce("pupa")
