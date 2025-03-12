class JsonData
    def test
        puts "test"
    end
end

# main
if __FILE__ == $0
    data = JsonData.new
    data.test
end