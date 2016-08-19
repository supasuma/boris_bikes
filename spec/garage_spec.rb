require "garage"
require "van"
require "bike"
require "docking_station"

describe Garage do
  it "can unload van's broken bikes and fix it" do
    broken_bike = double(:bike, report_fixed: false)
    van = double(:van, bikes_to_be_fixed: [broken_bike])

    subject.take_bikes(van)
    broken_bike.report_fixed
    expect(subject.fixed_bikes).to eq([broken_bike])

  end
end
