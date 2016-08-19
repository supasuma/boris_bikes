require 'docking_station'
require 'bike'

describe DockingStation do

  it 'checks for that a default capacity is assigned when creating a new instance' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'checks for that a specified capacity is assigned when creating a new instance' do
    station = DockingStation.new 25
    expect(station.instance_variable_get(:@capacity)).to eq(25)
  end



  describe '#release_bike' do
    it 'releases working bikes' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when bike is broken' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

  end

  describe '#dock(bike)' do

    it 'docks something' do
      bike = double(:bike, broken?: false)
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error when docking station is full' do
      bike = double(:bike, broken?: false)
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike)}.to raise_error 'Docking station is full'
    end
  end

  # it 'returns docked bike' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   expect(subject.bikes).to eq [bike]
  # end

end
