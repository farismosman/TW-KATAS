require 'test/unit'
include Test::Unit::Assertions

require './getAnagram'

class Test_kata6 < Test::Unit::TestCase
        
        
        def test_anagram
        	assert_equal("players",Anagram.test_if_word_is_an_anagram("parsley","players"))
        	assert_equal([], Anagram.test_if_word_is_an_anagram("parsley","paayers"))
        	assert_equal([], Anagram.test_if_word_is_an_anagram("parsley","parsley"))
        end
        
         def test_anagram_from_list
        	answer = Anagram.findAnagram_from_list("parsley", ["players", "replaya","replays", "playera", "sparely", "parsley"]).include? ("parsley" and "players" and "replays" and "sparely" )  
			assert_equal(true, answer)
       	end
         
#         def test_longest_word_and_max_anagram
#         	assert_equal([["sparely"], ["greenland", "coagulate", "longwords"]], Anagram.getAnagram_from_file("test_dict.txt"))
#         end        
end
