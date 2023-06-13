require 'rspec'
require './lib/visitor'
require './lib/ride'

describe 'Ride' do
  describe '#initialize' do
    it 'should initialize' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1.name).to eq("Carousel")
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end
  end
  describe '#board_rider and #rider_log' do
    it 'should check rider height, take money from visitor, and add to ride revenue' do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1) 
      
      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
    end
  end
end