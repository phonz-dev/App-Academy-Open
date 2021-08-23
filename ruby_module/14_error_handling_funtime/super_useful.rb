# PHASE 2
class CoffeeError < StandardError
  def message
    "Thanks, but no thanks, I've had too much caffeine. How about fruits? :))"
  end
end

class NotAFruitError < StandardError
  def message
    "I only eat fruit :("
  end
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee" 
    raise CoffeeError
  else
    raise NotAFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue NotAFruitError => e
    puts e.message
  end
end  

# PHASE 3

class BestFriendError < ArgumentError
  def message
    puts "We need more time to be bestfriends. Atleast 5 years of knowing each other."
  end
end


class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("Please include a name") if name.empty?
    raise ArgumentError.new("Please include a favorite pastime") if fav_pastime.empty?
    raise BestFriendError.newif yrs_known < 5
    
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
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


