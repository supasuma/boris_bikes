require 'van'
require 'docking_station'
require 'bike'

describe Van do
  it "can access docking station's empty broken bikes" do
    expect(subject.collect_broken_bikes(DockingStation.new)).to eq []
  end

  it "it can access docked broken bikes and store them" do
    broken_bike = Bike.new
    broken_bike.report_broken
    station = DockingStation.new
    station.dock(broken_bike)
    subject.collect_broken_bikes(station)
    expect(subject.bikes_to_be_fixed).to eq [broken_bike]
  end

  it "clears docking station array broken_bikes" do
    station = DockingStation.new
    broken_bike = Bike.new
    broken_bike.report_broken
    station.dock(broken_bike)
    subject.collect_broken_bikes(station)
    expect(station.broken_bikes).to eq []
  end

end
