class SearchFacade
  attr_reader :nearest_station,
              :mq_directions

  def initialize(address)
    nrel_json = NrelService.new.find_nearest_station(address)
    @nearest_station = Station.new(nrel_json[:fuel_stations].first)

    mq_json = MapQuestService.new.find_directions(@nearest_station.address, address)
    @mq_directions = Direction.new(mq_json)
  end
end