require './lib/bike_club'
require './lib/biker'
require './lib/ride'

RSpec.describe BikeClub do

  it "exists and has attributes" do
    bike_club = BikeClub.new("The Bike Club")

    expect(bike_club).to be_a(BikeClub)
    expect(bike_club.name).to eq("The Bike Club")
  end

  it "starts with no bikers" do
    bike_club = BikeClub.new("The Bike Club")

    expect(bike_club.biker).to eq([])
  end

  it "can add bikers" do
    bike_club = BikeClub.new("The Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Bob", 40)

    bike_club.add_biker(biker)
    bike_club.add_biker(biker2)

    expect(bike_club.biker).to eq([biker, biker2])
  end

  it "can tell us which biker the best time for a ride" do
    bike_club = BikeClub.new("The Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Bob", 40)
    bike_club.add_biker(biker)
    bike_club.add_biker(biker2)

    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

    biker.learn_terrain!(:gravel)
    biker.learn_terrain!(:hills)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)

    biker.log_ride(ride1, 120)
    biker.log_ride(ride2, 100)
    biker.log_ride(ride2, 150)

    biker2.log_ride(ride1, 90)
    biker2.log_ride(ride2, 150)
    biker2.log_ride(ride2, 200)

    expect(bike_club.best_time(ride1)).to eq(biker2)
    expect(bike_club.best_time(ride2)).to eq(biker)
  end

  # it "can tell us which biker is the most active" do
  #   bike_club = BikeClub.new("The Bike Club")
  #   biker = Biker.new("Kenny", 30)
  #   biker2 = Biker.new("Bob", 40)
  #   bike_club.add_biker(biker)
  #   bike_club.add_biker(biker2)

  #   ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
  #   ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

  #   biker.learn_terrain!(:gravel)
  #   biker.learn_terrain!(:hills)
  #   biker2.learn_terrain!(:gravel)
  #   biker2.learn_terrain!(:hills)

  #   biker.log_ride(ride1, 120)
  #   biker.log_ride(ride1, 100)
  #   biker.log_ride(ride2, 150)

  #   biker2.log_ride(ride1, 90)
  #   biker2.log_ride(ride1, 101)
  #   biker2.log_ride(ride2, 150)
  #   biker2.log_ride(ride2, 125)

  #   expect(bike_club.total_num_rides).to eq(biker2)
  # end
end
