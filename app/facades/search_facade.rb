class SearchFacade
  def initialize(address)
    @address = address
  end

  def find_station
    json = NrelService.new.find_nearest_station(@address)

    nearest_station = Station.new(json[:fuel_stations].first)
  end
end