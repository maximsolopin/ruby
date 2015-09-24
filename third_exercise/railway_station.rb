class RailwayStation
    attr_accessor  :trains, :name, :number
    @@all = []

    def self.all
        puts "All"
        @@all
    end

    def initialize(number, name)
        @number = number
        @name = name
        @trains = []
        #validate!
        @@all << self
    end

    def do_something(&block)
        trains.each do |train|
            block.call(train)
        end
    end

    def take_the_train(train)
        if trains.include? train
            puts "Поезд уже на этой станции"
        else
            trains << train
            puts "Поезд номер #{train.number} прибыл на станцию #{name}."
        end
    end

    def leave_the_train(train)
        trains.delete(train)
        puts "Поезд номер #{train.number} отправился со станции #{name}."
    end

    def show_trains_on_station
        if trains.size > 0
            puts "  Поезда на станции:"
            trains.each do |train|
                puts "      Поезд №#{train.number}"
            end
        else
            puts "  Поездов на станции нет"
        end
    end

    def valid?
        validate!
    rescue
        false
    end

    private

    def trains
        @trains
    end

    def validate!
        raise "Номер не может быть пустым" if number.nil?
        raise "Номер не может быть меньше 3 символов" if number.length < 3
        raise "Имя не может быть меньше 3 символов" if name.length < 3
        true
    end

end
