require './lib/ride'

RSpec.describe Ride do

  it "exists and has attributes" do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

    expect(ride1).to be_a(Ride)
    expect(ride1.name).to eq("Walnut Creek Trail")
    expect(ride1.total_distance).to eq(21.4)
    expect(ride1.terrain).to eq(:hills)
    expect(ride1.loop?).to eq(false)
  end

  it "can calculate total distance" do
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    
    expect(ride2.loop?).to eq(true)
    expect(ride2.total_distance).to eq(14.9)
  end
end

# pry(main)> ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
# # => #<Ride:0x00007f845c279ee8...>

# pry(main)> ride1.name
# # => "Walnut Creek Trail"

# pry(main)> ride1.distance
# # => 10.7

# pry(main)> ride1.terrain
# # => :hills

# pry(main)> ride1.loop?
# # => false

# pry(main)> ride1.total_distance
# # => 21.4

# pry(main)> ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
# # => #<Ride:0x00007f845c228b38...>

# pry(main)> ride2.loop?
# # => true

# pry(main)> ride2.total_distance
# # => 14.9
