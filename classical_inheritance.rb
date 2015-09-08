module Flight
  def fly 
    # @airspeed_velocity = airspeed_velocity
    puts "I'm #{name}, I'm flying at #{airspeed_velocity.to_s}!"
  end
end

class Animal
  attr_accessor :name, :legs
  def initialize(name, legs)
    @name = name
    @legs = legs
  end 
end

class Mammal < Animal 

end

class Primate < Mammal  
  def warm_blooded?
    true
  end 
end 

class Amphibian < Animal
  def warm_blooded?
    false
  end
end

class Bird < Animal
  attr_accessor :airspeed_velocity
  include Flight
  def initialize(name, legs)
    super
    @legs = 0
    @airspeed_velocity = "4 miles an hr"
  end 
end

class Bat < Mammal
  attr_accessor :airspeed_velocity
    def initialize(name, legs)
    super
    @airspeed_velocity = "10 miles an hr"
  end
  include Flight
end

class Parrot < Bird 
end 

class Frog < Amphibian

end 

class Chimpanzee < Primate
end

frog = Frog.new('Kermit', 2)
bat = Bat.new('Stellaluna', 2)
parrot = Parrot.new('Iago', 4)
chimpanzee = Chimpanzee.new('MVP', 2)



puts bat.fly
