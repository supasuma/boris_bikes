require_relative 'docking_station'

class Van

attr_reader :bikes_to_be_fixed
attr_reader :bikes_fixed

  def initialize
    @bikes_to_be_fixed = []
    @bikes_fixed = []
  end

  def collect_broken_bikes(docking_station)
    docking_station.broken_bikes.each {|bike| bikes_to_be_fixed << bike}
    docking_station.broken_bikes.clear
  end

end
