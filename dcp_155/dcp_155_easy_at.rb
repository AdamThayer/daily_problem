# This problem was asked by MongoDB.

# Given a list of elements, find the majority element, which appears more than half the time (> floor(len(lst) / 2.0)).

# You can assume that such element exists.

# For example, given [1, 2, 1, 1, 3, 4, 0], return 1.

def majority_number list_of_numbers
    numbers = {}
    list_of_numbers.each do |number|
        if numbers[number]
            numbers[number] =  numbers[number] + 1
        else  
            numbers[number] = 1
        end
    end
    numbers.max_by{|k,v| v}.first
end

majority_number [1, 2, 1, 1, 3, 4, 0]