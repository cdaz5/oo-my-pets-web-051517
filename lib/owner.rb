require 'pry'
class Owner

attr_accessor :pets, :name, :owner
attr_reader :species

@@all = []

def initialize(name)
  @pets = {fishes: [], cats: [], dogs: []}
  @@all << self
  @name = name
  @species = "human"
end

def self.all
  @@all
end

def self.reset_all
  @@all.clear
end

def self.count
  @@all.length
end

def say_species
  "I am a #{self.species}."
end

def buy_fish(name)
  fish = Fish.new(name)
  fish.owner = self.name
  self.pets[:fishes] << fish
end

def buy_cat(name)
  cat = Cat.new(name)
  cat.owner = self.name
  self.pets[:cats] << cat
end

def buy_dog(name)
  dog = Dog.new(name)
  dog.owner = self.name
  self.pets[:dogs] << dog
end

def walk_dogs
  self.pets[:dogs].each do |dog|
    dog.mood = "happy"
  end
end

def play_with_cats
  self.pets[:cats].each do |cat|
    cat.mood = "happy"
  end
end

def feed_fish
  self.pets[:fishes].each do |fish|
    fish.mood = "happy"
  end
end

def sell_pets
  self.pets.each do |type, pets|
    pets.each do |pet|
      pet.mood = "nervous"
    end
    pets.clear
  end
end

def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
end



end
