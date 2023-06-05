class BikeClub

  attr_reader :name,
              :biker

  attr_accessor :distance,
                :rides,
                :acceptable_terrain

  def initialize(name)
    @name = name
    @biker = []
  end

  def add_biker(biker)
    @biker << biker
  end

  # def most_active_biker
  #   @biker.max_by do |biker|
  #     biker.rides.count
  #   end
  # end

  def best_time(ride)
    @biker.min_by do |biker|
      biker.personal_record(ride)
    end
    
  end
  
  # def eligible_riders(bikers)
  #   @biker.find_all do |biker|
  #     if @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
  #       @rides[ride] = [] if @rides[ride].nil?
  #       @rides[ride] << time
  #     end
  #   end
  # end
end
