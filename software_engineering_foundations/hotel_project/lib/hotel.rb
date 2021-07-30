require_relative "room"

class Hotel
  attr_reader :rooms
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each do |room, capacity|
        @rooms[room] = Room.new(capacity)
    end
  end

  def name
    words = @name.split
    words.map { |word| word.capitalize }.join(" ")
  end

  def room_exists?(room_name)
    rooms.keys.include?(room_name)
  end

  def check_in(occupant_name, room_name)
    unless room_exists?(room_name)
        puts "sorry, room does not exist"
    else
        occupant_added =  rooms[room_name].add_occupant(occupant_name)

        if occupant_added
            puts "check in successful"
        else
            puts "sorry, room is full"
        end
    end
  end

  def has_vacancy?
    rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
    rooms.each do |room, room_space|
        puts "#{room} #{room_space.available_space}"
    end
  end
end
