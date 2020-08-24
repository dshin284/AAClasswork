# my_min
# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
def my_min(list)
    smaller_ele = []
    list.each do |ele1|
        list.each do |ele2|
            smaller_ele << [ele1,ele2].min  
        end
    end
    return smaller_ele.min
end
# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?


def my_min(list)
    smallest = list.first
    list.each do |ele|
        smallest = ele if ele < smallest
    end
    return smallest
end

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

def largest_contiguous_subsum(list)
    sub_arr = []
    list.each_with_index do |ele1,idx1|
        list.each_with_index do |ele2,idx2|
            sub_arr<< list[idx1..idx2] if idx2>=idx1
        end
    end
    p sub_arr.size
    sub_arr.map{ |sub| sub.sum}.max
    #(O(n^2 + m)
end
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

#O(a^2) + O(b) => a is the number of elements in list.
#b is the number of elements in  sub_arr

##O(a^2) is the time complexity.

# input:   output:
# 0           0
# 1           1
# 2           3
# 3           7
# 4           13
#2^n-1, n = input


# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

# def largest_contiguous_subsum1(list)
#     max_val = 0   #max_val = 7
#     current_val = 0  #current_val = 7
#     list.each.with_index do |ele, idx|
#        current_val += ele if current_val + ele >= current_val 
#        max_val = current_val if current_val > max_val
#     end
# end
def largest_contiguous_subsum(list)
    max_val = 0 #8
    current_sum = 0 #8
    list.each do |num|
        current_sum = [0, current_sum + num].max
        max_val = [max_val, current_sum].max
    end
    return max_val
end
#sliding window
# list = [2, 3, -6, 7, -6, 7] -> 8 #5, 4,3, 2, 1 (list.length - 1 times) * n

#O(list.length - 1)n)
#O((n-1)n)
#O(n^2 -n)

#look for long pile of positive numbers
#try to find lots of positive numbers 

# Get your story straight, and then explain your solution's time complexity to your TA.

