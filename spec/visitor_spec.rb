require 'rspec'
require 'visitor'

describe 'Visitor' do
  describe '#initialize' do
    it 'should initialize a Visitor object' do
      visitor1 = Visitor.new("Bruce", 54, "$10")
      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq (54)
      expect(visitor1.spending_money).to eq (10)
      expect(visitor1.preferences).to eq([])
    end
  end
  describe '#add_preference' do
    it 'should add a preference to the visitor object' do
      visitor1 = Visitor.new("Bruce", 54, "$10")
      expect(visitor1.preferences).to eq([])
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)
      expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end
  describe '#tall_enough' do
    it 'should compare visitor height and return if the visitor is above the passed value' do
      visitor1 = Visitor.new("Bruce", 54, "$10")
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')
      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64)).to eq(false)
    end
  end
end