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

  let(:bike) {double :bike}

    it 'releases working bikes' do
      allow(bike).to receive(:broken?).and_return(false)
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when bike is broken' do
      allow(bike).to receive(:broken?).and_return(true) 
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "This bike is broken"
    end

  end

  describe '#dock(bike)' do

    it 'docks something' do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error when docking station is full' do
      subject.capacity.times { subject.dock(double(:bike)) }
      expect { subject.dock(double(:bike))}.to raise_error 'Docking station is full'
    end
  end

  # it 'returns docked bike' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   expect(subject.bikes).to eq [bike]
  # end

end
