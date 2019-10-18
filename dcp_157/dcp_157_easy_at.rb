# This problem was asked by Amazon.

# Given a string, determine whether any permutation of it is a palindrome.

# For example, carrace should return true, since it can be rearranged to form racecar, which is a palindrome. daily should return false, since there's no rearrangement that can form a palindrome.

# There must be an even number of letters and numbers
# Per the example there can be only one odd letter

def get_pal str
    arr = str.split('')
    letters_used = {}
    odd = 0

    arr.each do |l|
        if !letters_used[l].nil?
            letters_used[l] = letters_used[l] + 1
            if letters_used[l] % 2 == 0
                odd -= 1
            else
                odd += 1
            end
        else
            letters_used[l] = 1
            odd += 1
        end
    end
    odd <= 1
end

get_pal "carrace"