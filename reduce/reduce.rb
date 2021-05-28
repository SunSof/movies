def task1(word)
  y = Hash.new(0)
  word.split("").each do |letter| 
    y[letter] += 1 
  end
  y
end

def task2(word)
  y = Hash.new 
  word.split("").each do |letter| 
    if y[letter]
      y[letter] += 1
    else
      y[letter] = 1
    end
  end
  y
end
# {:a => 1} {a: 1}


def task3(word)
  word.split("").reduce(Hash.new(0)){ |acc, el| acc[el] += 1; acc}
end

p task3("pupa") 
# arr = [1,2,3]

# arr[1] = 4 

# hash = {a:1, b:2}
# hash[b] = 3