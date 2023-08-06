class Direction
  attr_reader :distance,
              :travel_time,
              :directions

  def initialize(data)
    @distance = data[:route][:distance]
    @travel_time = data[:route][:formattedTime]
    @directions = format_directions(data[:route][:legs][0][:maneuvers])
  end

  def format_directions(data)
    directions = []
    data.map do |data_details|
      directions << data_details[:narrative]
    end
  
    directions.join(" ")
  end
end