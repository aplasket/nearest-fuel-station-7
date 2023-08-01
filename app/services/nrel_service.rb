class NrelService
  def find_nearest_station(address)
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?") do |request|
      request.params["location"] = address
      request.params["fuel_type"] = "ELEC"
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params['api_key'] = ENV["nrel_api_key"]
    end
  end
end