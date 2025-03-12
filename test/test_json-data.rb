require 'minitest/autorun'
require_relative '../lib/json-data'

class TestJsonData < Minitest::Test
    def setup
        # @ means instance variable
        @data = JsonData.new
    end

    def test_test
        assert_output("test\n") { @data.test }
    end

    def test_fail
        assert_output("fail\n") { @data.test }
    end
end