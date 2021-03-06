class Route
    attr_accessor  :stations, :cur_index

    def initialize
        @stations = []
        @cur_index = 0
    end

    def stations
        @stations
    end

    def cur_index
        @cur_index
    end

    def add_station(station)
        stations << station if validate!(station)

    end

    def del_station(station)
        stations.delete station if validate!(station)
        puts "Удалена станция #{station.name}"
    end

    def start_station
        stations.last
    end

    def end_station
        stations.first
    end

    def next_station
        @cur_index = @cur_index + 1
        puts "Следующая станция #{stations[cur_index].name}"
    end

    def cur_station
        puts "Текущая станция #{stations[cur_index].name}"
    end

    def print_routes
        puts "Список станций"
        stations.each do |station|
            puts "#{station.name}"
        end
    end

    def valid?
        validate!
    rescue
        false
    end

    protected

    def validate!(station)
        raise "Станция не может быть пустой" if station.nil?
        raise "Class error!" unless station.class == RailwayStation
        true
    end
end
