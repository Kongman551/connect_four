class Player
    attr_accessor :name
    attr_reader :symbol
    
    def initialize(symbol, name = nil)
        @name = name
        @symbol = symbol
    end
end
