require 'docking_station'

describe DockingStation do
  it  { is_expected.to respond_to :release_bike  }

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

    it 'raises an error when docking station is full' do
      20.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new)}.to raise_error 'Docking station is full'
    end

    it 'docks bike' do
      bike = Bike.new
      expect(subject).to respond_to(:dock).with(1).argument
    end

  end

  it { is_expected.to respond_to(:bikes)}

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end
end
