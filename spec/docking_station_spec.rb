require 'docking_station'

describe DockingStation do
  it 'expects DockingStation instances to respond_to the method release_bike' do
    expect(DockingStation).to respond_to(release_bike)  
  end

end
