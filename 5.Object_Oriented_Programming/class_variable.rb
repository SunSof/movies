module Car
  class Volvo
    @@wheels = 4
    def self.wheels
      @@wheels
    end

    def how_many_wheels
      puts @@wheels
    end
  end
end

module Truck
  class Volvo
    @@wheels = 6
    def self.wheels
      @@wheels
    end

    def how_many_wheels
      puts @@wheels
    end
  end
end
car = Car::Volvo.new
truck = Truck::Volvo.new
car.how_many_wheels
truck.how_many_wheels
