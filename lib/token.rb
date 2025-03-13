class Token
    attr_accessor :type, :value

    def initialize(type, value)
        @type = type
        @value = type
    end
end

module TokenType
    CURLY_BRACKET_OPEN = 0,
    CURLY_BRACKET_CLOSE = 1,
    STRING = 2,
    NUMBER = 3,
    BOOLEAN = 4,
    COLON = 5
end