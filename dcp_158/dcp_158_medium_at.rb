# This problem was asked by Slack.

# You are given an N by M matrix of 0s and 1s. Starting from the top left corner, how many ways are there to reach the bottom right corner?

# You can only move right and down. 0 represents an empty space while 1 represents a wall you cannot walk through.

# For example, given the following matrix:

# [[0, 0, 1],
#  [0, 0, 1],
#  [1, 0, 0]]
# Return two, as there are only two ways to get to the bottom right:

# Right, down, down, right
# Down, right, down, right
# The top left corner and bottom right corner will always be 0.

# How large can the matrix be
# Will there always be 0 and 1's

# if last digit is a 1 return nil
# if right down are both ones, return nil
# if first digits is a 1 return nil
# keep pace with two arrays an the index you are at to check for next move

# keep track og moves played to not go over that next move
# maybe duplicate the array, or update the array with 2 to not go over the same path twice

#check next index and current index of next array is 0
# if right is zero, go right
# if down is zero, go down
# if both go right

def get_to_the_end two_d_array
    index1 = 0
    index2 = 0
    position = [0, 0]

    return nil if position == 1
    return nil if two_d_array.last.pop == 1
    
    # check right
    if two_d_array[index1][index2 + 1] == 0
        index2 += 1
        position = [index1, index2]
    # check down
    elsif two_d_array[index1 + 1][index2] == 0
        index1 += 1
        position = [index1, index2]
    end
    
end