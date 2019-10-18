# This problem was asked by Google.

# Given a string, return the first recurring character in it, or null if there is no recurring character.

# For example, given the string "acbbac", return "b". Given the string "abcdef", return null.

def run_forrest str
    return nil if str.length == 0 
    its_been_used_twice = nil
    seen_it = {}
    letters = str.split('')
    letters.each do |l|
        if seen_it[l] == 1
            its_been_used_twice = l
            break
        else
            seen_it[l] = 1
        end
    end
    its_been_used_twice
end

run_forrest "acbbac"