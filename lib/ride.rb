class Ride
  
  attr_reader :name, 
              :distance, 
              :terrain

  def initialize(ride_info)
    @name = ride_info[:name]
    @distance = ride_info[:distance]
    @terrain = ride_info[:terrain]
    @loop = ride_info[:loop]
  end

  def loop?
    @loop
  end

  def total_distance
    if loop? 
      @distance
    else
      @distance * 2
    end
  end
end
