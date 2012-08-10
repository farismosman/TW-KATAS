
def getTeam(filename)
	scorefile = open(filename,'r')
	score_read = scorefile.readlines()
	scorefile.close()
	
	spread_fun = []
	team=[]
	
	for line in score_read
	
		line = line.split( ) # get rid of any whitespace
		
		if line[2].to_i.to_s == line[2]
			forScore = line[6]
			againstScore = line[8]
			spread_value = forScore.to_i - againstScore.to_i
			
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
