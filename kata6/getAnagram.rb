module Anagram
	
	def self.convert_words_to_alphabet_test(a_word)
		new_words = a_word.split("")
		result = "( "
		for alphabet in new_words[0..-2]
			result << "\"%s\" and "%alphabet
		end	
		result << "\"%s\" )"% new_words[-1]
		
		puts result
		
		if a_word.include? eval(result)
			puts eval(result)
		end
		return result	
		
	end
	
	
	def self.test_if_word_is_an_anagram(a_word,another_word)
		new_words = a_word.split("")
		result = []	
		
		if a_word.length == another_word.length and a_word != another_word
			ind = 0	
			for alpha in new_words
				break if not another_word.include? alpha
				ind +=1;		
			end	
			
			result = another_word if ind == a_word.length 			
		end
		
		return result	
		
	end
	
	def self.findAnagram_from_list(the_word, from_list_of_words)
		result= []
				
		for test_word in from_list_of_words
			new_result = test_if_word_is_an_anagram(the_word,test_word)
			result.push(new_result)
			print result, test_word
			puts
		end
		
		result.reject!{|c| c.empty?}
		
		print "final result ", result
		puts
		puts result.include? ("parsley" and "players" and "replays" and "sparely" )
		return result
	end
	
	def self.getAnagram_from_file(filename)
	
		words = File.open(filename){|f| f.readlines}
		
		words= words.map{|x| x.chomp.strip}
		sorted_words = words.sort_by{|x| x.length}
		
		length_of_words = sorted_words.map {|x| x.length}
		unique_length_of_words= length_of_words.uniq
		index_of_unique_length_of_words = unique_length_of_words.map{|x| length_of_words.index(x)}
		
		
		
		list_of_words=[]
		anagram_length=[]
		word_length=[]
		
		for ind  in (0...unique_length_of_words.length-1)
		
			word_of_the_same_length=sorted_words[index_of_unique_length_of_words[ind]...
				index_of_unique_length_of_words[ind+1]]
		
			for the_word in word_of_the_same_length
			
				anagram_of_the_word = findAnagram_from_list(the_word, word_of_the_same_length)
					
				if anagram_of_the_word.length >1
					list_of_words.push(the_word)
					anagram_length.push(anagram_of_the_word.length)
					word_length.push(the_word.length)
				end
							
				anagram_of_the_word.each{ |w| word_of_the_same_length.delete(w)}
			end
		end
		
		ind = unique_length_of_words.length-1
		the_word = sorted_words[index_of_unique_length_of_words[ind]]
		word_of_the_same_length = sorted_words[index_of_unique_length_of_words[ind-1]..index_of_unique_length_of_words[ind]]
		
		anagram_of_the_word = findAnagram_from_list(the_word, word_of_the_same_length)
		
		if anagram_of_the_word.length >1
			list_of_words.push(the_word)
			anagram_length.push(anagram_of_the_word.length)
			word_length.push(the_word.length)
		end
		
		
		## find max anagram and max length
		max_anagram = anagram_length.max()
		longest_word = word_length.max()
		
		all_max_anagram = []
		anagram_length.each_index{|x|  all_max_anagram << list_of_words[x] if anagram_length[x] == max_anagram}
		
		all_longest_word = []
		word_length.each_index{|x|  all_longest_word << list_of_words[x] if word_length[x] == longest_word}
		
		return all_max_anagram, all_longest_word		
		
	end
	
# 	def print_ouputs
# 	
# 		puts <<MAX_ANA
# 			The word that has the maximum number of anagram is #{all_max_anagram}. It has #{max_anagram} 
# 			numbers of anagram.
# MAX_ANA
# 			
# 		
# 		puts <<LONG_WORD
# 		The longest word that has anagram is #{all_longest_word}. It's lenght is #{longest_word}.
# LONG_WORD		
# 	
# 	end

end
