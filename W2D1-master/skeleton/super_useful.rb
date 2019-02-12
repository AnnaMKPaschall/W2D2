require "byebug"
class CoffeeError < StandardError
  def message
    puts "Thanks for the coffee I'll give you another try"
  end
end

class OtherError < StandardError
  def message
    puts "You sink"
  end
end

class WrongYearError < StandardError
  def message 
    puts "You're not my best friend."
  end 
end 

class NoImaginaryFriendsError < StandardError
  def message 
    puts "Are you a ghost?"
  end 
end 

# PHASE 2
# class InputError < StandardError ;end
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise OtherError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue CoffeeError => e
    e.message
     retry
  rescue OtherError => e
    e.message
  end
end  

# PHASE 4
class BestFriend
  # attr_accessor :fav_pastime

  def initialize(name, yrs_known, fav_pastime)
    @name = name raise NoImaginaryFriendsError if name.length <= 0
    @yrs_known = yrs_known raise WrongYearError if yrs_known < 5 
    @fav_pastime = fav_pastime raise NoImaginaryFriendsError if fav_pastime.length <= 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


