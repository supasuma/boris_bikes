require_relative 'van'
require_relative 'bike'

class Garage
  def initialize
    @fixed_bikes = []
  end

  def take_bikes(van)
    van.bikes_to_be_fixed.each {|bike| fix_bikes(bike) }
    van.bikes_to_be_fixed.clear
  end

  def fix_bikes(bike)
    bike.report_fixed
    @fixed_bikes << bike
  end
end
