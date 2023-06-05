class Biker
  attr_reader :name, 
              :max_distance, 
              :rides, 
              :acceptable_terrain

  attr_accessor :distance

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  # def log_ride(ride, miles)
  #   @rides[ride] = [] if @rides[ride].nil?
  #   @rides[ride] << miles
  # end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
      @rides[ride] = [] if @rides[ride].nil?
      @rides[ride] << time
    end
  end

  def personal_record(ride)
    if @rides[ride].nil?
      nil
    else
      @rides[ride].min
    end
  end
end
