# There exists a staircase with N steps, and you can climb up either 1 or 2 steps at a time. Given N, write a function that returns the number of unique ways you can climb the staircase. The order of the steps matters.

# For example, if N is 4, then there are 5 unique ways:

# 1, 1, 1, 1
# 2, 1, 1
# 1, 2, 1
# 1, 1, 2
# 2, 2
# What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number from a set of positive integers X? For example, if X = {1, 3, 5}, you could climb 1, 3, or 5 steps at a time.

# n = 1  1 <- {[0, 1]}

# n = 2  2 <- {[0,1,2], [0,2]}

# n = 3  3 <- {[0,1,2,3], [0,1,3], [0,2,3]}

# n = 4  5 <- {[0,1,2,3,4], [0,1,2,4], [0,1,3,4], [0,2,3,4], [0,2,4]}

# grab the pattern and switch the numbering

# n = 1  1 <- {[1, 0]}

# n = 2  2 <- {[2,1,0], [2,0]}

#   num_ways(3) = num_ways(2) + num_ways(1)

# n = 3  3 <- {[3,2,1,0], [3,1,0], [3,2,0]}

# n = 4  5 <- {[4,3,2,1], [4,3,2,0], [4,3,1,0], [4,2,1,0], [4,2,0]}


def num_ways n
  return 1 if num_of_steps <= 1
  return num_ways(n-1) + num_ways(n-2)
end

def num_ways_bottom_up n
  return 1 if n <= 1
  nums = Array.new(n + 1)
  nums[0] = 1; nums[1] = 1
  for i in 2..n
    nums[i] = nums[i-1] + nums[i-2]
  end
  nums[n]
end

x = {1,3,5}

def num_ways_x n
  return 1 if n == 0
  total = 0
  [1,3,5].each do |i|
    total += num_ways_x(n - i) if (n - i) >= 0
  end
  total
end

def num_ways_x_bottom_up n
  return 1 if n == 0
  nums = Array.new(n + 1)
  nums[0] = 1
  for i in 1..n
    total = 0
    [1,3,5].each do |j|
      total += nums[i - j] if (i -j) >= 0
    end
    nums[i] = total
  end
  nums[n]
end
