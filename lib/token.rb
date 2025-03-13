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
    BRACKET_OPEN = 2,
    BRACKET_CLOSE = 3,
    STRING = 4,
    NUMBER = 5,
    BOOLEAN = 6,
    COLON = 7,
    COMMA = 8
end