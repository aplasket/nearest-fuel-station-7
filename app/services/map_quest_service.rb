class MapQuestService
  def find_directions(nearest_station, address)
    response = conn.get("/directions/v2/route") do |request|
      request.params['from'] = address
      request.params['to'] = nearest_station
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    conn = Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
      faraday.params['key'] = ENV["mapquest_api_key"]
    end
  end
end