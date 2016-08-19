require_relative 'bike'

class DockingStation
  attr_reader :capacity
  attr_reader :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

  def dock(bike)
    fail "Docking station is full" if full?
    if bike.broken?
      broken_bikes << bike
    else
      bikes << bike
    end
  end

  def clear_broken_bikes
    broken_bikes.clear
  end


private

  attr_reader :bikes


  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end
end
