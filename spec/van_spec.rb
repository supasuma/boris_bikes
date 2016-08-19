require 'van'
require 'docking_station'
require 'bike'

describe Van do
  it "can access docking station's empty broken bikes" do
    expect(subject.collect_broken_bikes(DockingStation.new)).to eq []
  end

  it "can access docked broken bikes" do
    broken_bike = Bike.new
    broken_bike.report_broken
    station = DockingStation.new
    station.dock(broken_bike)
    expect(subject.collect_broken_bikes(station)).to eq [broken_bike]
  end

end
