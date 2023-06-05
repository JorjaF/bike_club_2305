class BikeClub

  attr_reader :name,
              :biker

  attr_accessor :distance,
                :rides,
                :acceptable_terrain,
                :name

  def initialize(name)
    @name = name
    @biker = []
  end

  def add_biker(biker)
    @biker << biker
  end

  # def total_num_rides
    
  #   @biker.sum do |biker|
  #     biker.rides.length
  #   end
  #   # return @biker
  # end

  def best_time(ride)
    @biker.min_by do |biker|
      biker.personal_record(ride)
    end
  end
end
