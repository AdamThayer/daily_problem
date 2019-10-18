# This problem was asked by Slack.

# You are given a string formed by concatenating several words corresponding to the integers zero through nine and then anagramming.

# For example, the input could be 'niesevehrtfeev', which is an anagram of 'threefiveseven'. Note that there can be multiple instances of each integer.

# Given this string, return the original integers in sorted order. In the example above, this would be 357.


# Problems that need to be solved

# Anagram
# number can be in there multiple times
# are there always going to be whole numbers.
# find the sorted order? Asc
# one could or could not be in the list, so the order of checking for number cant be sequential

# zero
# one
# two
# three
# four
# five
# six
# seven
# eight
# nine

# if z there is a zero
# if w there is a two
# if u there is a four
# if x there is a six
# if g there is a eight
# if s there is a seven
# if v there is a five
# if o there is a one
# if i there is a nine
# if e there is a three

# NOT USED
# letters_to_find = [z, w, u, x, g, s, v, o, i , e]
# letters_to_numbers = {
#   0: 'zero',
#   2: 'two',
#   4: 'four',
#   6: 'six',
#   8: 'eight',
#   7: 'seven',
#   5: 'five',
#   1: 'one',
#   9: 'nine',
#   3: 'three'
# }

@letters_to_numbers = {
  'z' => { 0 => 'zero' },
  'w' => { 2 => 'two' },
  'u' => { 4 => 'four' },
  'x' => { 6 => 'six' },
  'g' => { 8 => 'eight' },
  's' => { 7 => 'seven' },
  'v' => { 5 => 'five' },
  'o' => { 1 => 'one' },
  'i' => { 9 => 'nine' },
  'e' => { 3 => 'three'}
}

# NOT USED
# @letters_to_numbers = {
#   0 => { 'z' => 'zero' },
#   2 => { 'w' => 'two' },
#   4 => { 'u' => 'four' },
#   6 => { 'x' => 'six' },
#   8 => { 'g' => 'eight' },
#   7 => { 's' => 'seven' },
#   5 => { 'v' => 'five' },
#   1 => { 'o' => 'one' },
#   9 => { 'i' => 'nine' },
#   3 => { 'e' => 'three'}
# }

def decipher str
  # split the str into an array. example ['n', 'i', 'e', 's', 'e', 'v']
  # create final array to store found values
  arr = str.split('')
  final = []

  # loop through letter_to_numbers created earlier
  @letters_to_numbers.each do |letter, hash|
    # On the first go around letter=z, arr=['n', 'i', 'e', 's', 'e', 'v'], hash={ 0 => 'zero' }, number_result=[]
    # pass in arr, letter, hash, number_result to get_number()
    number_result = []
    # store the array of numbers returned by get_number()
    final << get_number(arr, letter, hash, number_result)
  end
  final.flatten.sort.join.to_i
end

# Recursion meethod
def get_number(arr, l, hash, result)
  # if the array passed in includes a 'z' on the first go around, where are in business, 
  # if not, return the empty result and move on to the next letter in letter_to_numbers
  if arr.include?(l)
    # the hash{0 => 'zero'} passed in contains the actual number as the key
    # grab the key '0' and store it into the result array that was passed in
    result << hash.keys.first

    # the hash{0 => 'zero'} passed in contains the actual string 'zero' as the value
    # then remove all the letters that spell zero from the array 
    hash.values.first.split('').each do |l|
      arr.delete_at(arr.index(l))
    end
    # if after deleting all the values the array still includes 'z', go through the process again, if not, program moves on and returns the result array.
    get_number(arr, l, hash, result) if arr.include?(l)
  end
  # return the result
  result
end

decipher 'niesevehrtfeev'
decipher 'niesevehrtfeevzero'