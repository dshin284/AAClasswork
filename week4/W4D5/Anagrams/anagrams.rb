require "byebug"

# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each one's overall runtime
# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.
def first_anagram?(string1, string2)
    possible_arr = string1.chars.permutation.to_a
    possible_arr.include?(string2.chars) ? true : false
end
# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the 
#second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the 
#second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??
def second_anagram?(string1, string2)
    string1.each_char.with_index do |char, idx|
        idx1 = string2.chars.find_index(char)
        return false if idx1 == nil
        string2_split = string2.chars
        string2_split.delete_at(idx1)
        string2 = string2_split.join()
    end
    string2.empty? ? true : false
end

#chars does same thing as split on empty string.



# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.

def third_anagram?(string1, string2)
    return string1.downcase.chars.sort == string2.downcase.chars.sort
end



# What is the time complexity of this solution? Is it better or worse than #second_anagram??

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.

# Discuss the time complexity of your solutions together, then call over your TA to look at them.

def fourth_anagram?(string1,string2)
    hash1 = Hash.new{ |h,k| h[k]= 0}
    hash2 = Hash.new(0)

    string1.each_char do |char|
        hash1[char] +=1 
    end
    string2.each_char do |char|
        hash2[char] += 1
    end
    hash1 == hash2 
end



def fourth_anagram?(string1,string2)
    hash1 = Hash.new{ |h,k| h[k]= 0}
    # hash2 = Hash.new(0)

    string1.each_char do |char|
        hash1[char] +=1 
    end
 
    string2.each_char do |char|
        hash1[char] -= 1
    end
    return hash1.all? { |_,v| v == 0}
    #hash1.values.all?{ |value| value == 0}
end