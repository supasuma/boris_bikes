require_relative 'docking_station'

class Van

  def initialize
    @bikes_to_be_fixed = []
    @bikes_already_fixed = []
  end

  def collect_broken_bikes(docking_station)
    bikes_to_be_fixed = docking_station.broken_bikes
  end

  attr_reader :bikes_to_be_fixed

end
