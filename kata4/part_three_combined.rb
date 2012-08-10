
def getValue(filename, first )
	targetfile = open(filename,'r')
	target_read = targetfile.readlines()
	targetfile.close()
	
	spread_fun = []
	team=[]
	
	for line in target_read
	
		line = line.split( ) # get rid of any whitespace
		
		if line[2].to_i.to_s == line[2]
			fortarget = line[6]
			againsttarget = line[8]
			spread_value = fortarget.to_i - againsttarget.to_i
			
			spread_fun.push(spread_value)
			team.push(line[1])
	
		end
	end
	
	maxSpread = spread_fun.max()
	maxIndex = spread_fun.index(maxSpread)
	theTeam = team[maxIndex]
	
	return theTeam, maxSpread
	
end

puts getTeam('football.dat')
