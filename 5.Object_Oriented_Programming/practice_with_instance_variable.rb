# class Cat
# def initialize(legs_count)
#   @legs = legs_count
# end

# attr_readr :legs
# def legs
#   @legs
# end

# attr_writer :legs
# def legs=(new_legs)
#   @legs = new_legs
# end

#   attr_accessor :legs
# end

# cat = Cat.new
# cat.legs = 5
# p cat

# class BirdsCollection
#   attr_accessor :colection

#   def initialize(collection)
#     @collection = collection
#   end

#   def col
#     c = @collection
#     c.map { |el| el.transform_keys(&:to_sym) }
#   end
# end

# class Bird
#   attr_reader :name

#   def initialize(hash)
#     @name = hash['name']
#     @color = hash['color']
#   end
# end

# birds_hash = [{ 'name' => 'sinica', 'color' => 'yellow' }, { 'name' => 'dytel', 'color' => 'red' }]
# a = birds_hash.map do |hash|
#   Bird.new(hash)
# end
# p a

# bird = Bird.new(birds_hash[0])
# bird.name
# bird2 = Bird.new(birds_hash[1])

class Flowers
  def initialize(hash)
    @name = hash[:name]
    @color = hash[:color]
  end
end

def bibi
  flowers_array = [{ name: 'dandelion,', color: 'yellow' }, { name: 'sunflower', color: 'yellow,black' },
                   { name: 'chamomile', color: 'white,yellow' }]
  flowers_array.map { |hash| Flowers.new(hash) }
end
