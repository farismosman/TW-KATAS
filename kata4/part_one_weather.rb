require 'test/unit'
include Test::Unit::Assertions

def getDay(filename)
	weather_read = open(filename,'r'){ |f| f.readlines() }
	
	
	spread_fun = []
	day = []
	
	for line in weather_read
		line = line.split # get rid of any whitespace
		if line[0].to_i.to_s == line[0]
			maxcol = line[1]
			mincol = line[2]
			spread_value = maxcol.to_f - mincol.to_f
			
			spread_fun.push(spread_value)
			day.push(line[0])
	
		end
	end
	
	minSpread = spread_fun.min()
	minIndex = spread_fun.index(minSpread)
	theDay = day[minIndex]
	
	return theDay, minSpread
	
end

class TC_EXAMPLE < Test::Unit::TestCase
	
	def test_weather
		assert_equal(["14", 2.0], getDay('weather.dat'))
	end
end
