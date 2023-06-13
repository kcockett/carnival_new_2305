require './lib/visitor'

class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement, 
              :total_revenue,
              :rider_log

  def initialize(info_hash)
    @name = info_hash[:name]
    @min_height = info_hash[:min_height]
    @admission_fee = info_hash[:admission_fee]
    @excitement = info_hash[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new { |h, k| h[k] = 0}
  end

  def board_rider(rider) # checks height, ride type, and money requirements
    if rider.height >= @min_height && rider.spending_money >= @admission_fee && rider.preferences.include?(@excitement)
      @rider_log[rider] +=1
      @total_revenue += @admission_fee
      rider.take_fee(@admission_fee)
    end
  end

end