require 'docking_station'

describe DockingStation do

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end

  describe '#release_bike' do

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock(bike)' do

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error when docking station is full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new)}.to raise_error 'Docking station is full'
    end
  end

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end
end
