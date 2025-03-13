require 'minitest/autorun'
require_relative '../lib/lexer'
require_relative "../lib/token"

class TestLexer < Minitest::Test
    def setup
        @lexer = Lexer.new
    end

    def test_empty
        assert_equal [], @lexer.lex("")
    end

    def test_object_with_string
        assert_equal [
            Token.new("{", TokenType::CURLY_BRACKET_OPEN), 
            Token.new("name", TokenType::STRING),
            Token.new(":", TokenType::COLON),
            Token.new("Bob", TokenType::STRING),
            Token.new("}", TokenType::CURLY_BRACKET_CLOSE)
        ], @lexer.lex("{ \"name\": \"Bob\" }")
    end

    def test_object_with_number
        assert_equal [
            Token.new("{", TokenType::CURLY_BRACKET_OPEN), 
            Token.new("age", TokenType::STRING),
            Token.new(":", TokenType::COLON),
            Token.new(28, TokenType::NUMBER),
            Token.new("}", TokenType::CURLY_BRACKET_CLOSE)
        ], @lexer.lex("{ \"age\": \"28\" }")
    end

    def test_object_with_boolean
        assert_equal [
            Token.new("{", TokenType::CURLY_BRACKET_OPEN), 
            Token.new("alive", TokenType::STRING),
            Token.new(":", TokenType::COLON),
            Token.new(true, TokenType::BOOLEAN),
            Token.new("}", TokenType::CURLY_BRACKET_CLOSE)
        ], @lexer.lex("{ \"alive\": \"28\" }")
    end

    def test_nested_objects
        assert_equal [
            Token.new("[", TokenType::BRACKET_OPEN),
            Token.new("{", TokenType::CURLY_BRACKET_OPEN),
            Token.new("object1", TokenType::STRING),
            Token.new(":", TokenType::COLON),
            Token.new("test", TokenType::STRING),
            Token.new("}", TokenType::CURLY_BRACKET_CLOSE),
            Token.new(",", TokenType::COMMA),
            Token.new("{", TokenType::CURLY_BRACKET_OPEN),
            Token.new("object2", TokenType::STRING),
            Token.new(":", TokenType::COLON),
            Token.new("{", TokenType::CURLY_BRACKET_OPEN),
            Token.new("test", TokenType::STRING),
            Token.new(":", TokenType::COLON),
            Token.new("test", TokenType::STRING),
            Token.new("}", TokenType::CURLY_BRACKET_CLOSE),
            Token.new("}", TokenType::CURLY_BRACKET_CLOSE),
            Token.new(",", TokenType::COMMA),
            Token.new("{", TokenType::CURLY_BRACKET_OPEN),
            Token.new("object3", TokenType::STRING),
            Token.new(":", TokenType::COLON),
            Token.new("test", TokenType::STRING),
            Token.new("}", TokenType::CURLY_BRACKET_CLOSE),
            Token.new("]", TokenType::BRACKET_CLOSE)
        ], @lexer.lex("[{\"object1\":\"test\"},{\"object2\":{\"test\":\"test\"}},{\"object3\":\"test\"}]")
    end
end