# This problem was asked by Facebook.

# Given a positive integer n, find the smallest number of squared integers which sum to n.

# For example, given n = 13, return 2 since 13 = 32 + 22 = 9 + 4.

# Given n = 27, return 3 since 27 = 32 + 32 + 32 = 9 + 9 + 9.

# If there is 0 0^2 + 0^2 
# If there is 1 0^2 + 1^2
# If there is 2 1^2 + 1^2
# If there is 3 1^2 + 1^2 + 1^2 



nearest_sq = n => Math.pow(Math.round(Math.sqrt(n)), 2);

Math.sqrt(27).floor

def get_small int
    whats_left=int
    cur_total=0 
    sqr_numbers=[]
    arr_num = lets_do_this whats_left, cur_total, sqr_numbers, int
    arr_num[sqr_numbers.length - 1] = sqr_numbers.delete_at(sqr_numbers.length - 1).to_s.concat("^2")
    arr_num.join('^2 + ')
end

def lets_do_this whats_left, cur_total, sqr_numbers, int
    perfect_sqr_int = Math.sqrt(whats_left).floor
    sqr_numbers << perfect_sqr_int
    perfect_sqr_int_sqr = perfect_sqr_int ** 2
    cur_total += perfect_sqr_int_sqr
    whats_left = int - cur_total
    lets_do_this whats_left, cur_total, sqr_numbers, int if cur_total < int
    sqr_numbers
end

get_small 27