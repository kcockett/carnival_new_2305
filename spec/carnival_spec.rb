require 'rspec'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

describe 'Carnival' do
  before(:each) do
    @carnival1 = Carnival.new(14)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
  end
  describe '#initialize' do
    it 'should initialize' do
      expect(@carnival1).to be_a(Carnival)
      expect(@carnival1.duration).to eq(14)
      expect(@carnival1.rides).to eq([])
    end
  end
  describe '#add_ride' do
    it 'should add a ride to the Carnival' do
      expect(@carnival1.rides).to eq([])
      @carnival1.add_ride(@ride1)
      expect(@carnival1.rides).to eq([@ride1])
      @carnival1.add_ride(@ride2)
      expect(@carnival1.rides).to eq([@ride1, @ride2])
    end
  end
end