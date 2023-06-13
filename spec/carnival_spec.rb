require 'rspec'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

describe 'Carnival' do
  describe '#initialize' do
    it 'should initialize' do
      carnival1 = Carnival.new(14)
      expect(carnival1).to be_a(Carnival)
      expect(carnival1.duration).to eq(14)
      expect(carnival1.rides).to eq([])
    end
  end
  describe '#add_ride' do
    it 'should add a ride to the Carnival' do
      carnival1 = Carnival.new(14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      expect(carnival1.rides).to eq([])
      carnival1.add_ride(ride1)
      expect(carnival1.rides).to eq([ride1])
      carnival1.add_ride(ride2)
      expect(carnival1.rides).to eq([ride1, ride2])
    end
  end
  describe '#most_popular_ride' do
    it 'should return the most popular ride' do
      carnival1 = Carnival.new(14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor3.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor3)
      ride1.board_rider(visitor1)
      ride2.board_rider(visitor1)
      ride2.board_rider(visitor2)
      ride3.board_rider(visitor3)

      expect(carnival1.most_popular_ride).to eq(ride1)
    end
  end
end