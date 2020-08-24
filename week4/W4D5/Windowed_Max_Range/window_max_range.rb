def windowed_max_range(arr, w_size )
    current_max_range = 0
    difference = nil
    arr.each_with_index do |ele,idx|
        break if idx == arr.length - (w_size - 1)
        range = arr[idx..idx + (w_size - 1)] #same as slicing?
        difference = range.max - range.min
        current_max_range = difference if difference > current_max_range
    end
    return current_max_range
end
# One approach to solving this problem would be:

# Initialize a local variable current_max_range to nil.
# Iterate over the array and consider each window of size w. For each window:
# Find the min value in the window.
# Find the max value in the window.
# Calculate max - min and compare it to current_max_range. Reset the value of current_max_range if necessary.
# Return current_max_range.

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


class MyQueue

    def initialize
      @store = []
    end

    def enqueue(item)
        store.push(item)
    end


    def dequeue
        store.shift
    end

    def peek
        store.last 
    end

    def size
        store.size
    end

    def empty?
        store.empty?
    end

    private
    attr_reader :store
end


class MyStack

    def initialize(color)
        @color = color
        @store = []
    end

    def push(element)
        store.push(element)
    end

    def pop
        self.store.pop
    end

    
    
    def empty?
        store.empty?
    end
    private
    def peek
        store.last
    end
    attr_reader :store
    protected 
    def size
       store.length
    end
    
end
class BabyStack < MyStack
    def initialize(size)
        @size = size
        super()
    end
end
def test_stack(stack)
    stack.peek
end

# private
# private methods cannot be called with an explicit receiver. Because you cannot specify an object when using them, private methods can be called only in the defining class. ...
# Protected methods can be invoked only by objects of the defining class and its subclasses. Access is kept within the family.

class StackQueue

    def initialize
    end



end


