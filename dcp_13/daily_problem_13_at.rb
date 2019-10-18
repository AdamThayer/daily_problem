# This problem was asked by Amazon.
#
# Given an integer k and a string s, find the length of the longest substring that contains at most k distinct characters.
#
# For example, given s = "abcba" and k = 2, the longest substring with k distinct characters is "bcb".

def longest_substring_with_k_distinct_characters(s, k)
  current_longest_substring = ''
  for i in 0..s.length do
    for j in (i + 1)..(s.length + 1) do
      substring = s[i..j]
      if substring.chars.uniq.count <= k && substring.length > current_longest_substring.length
        current_longest_substring = substring
      end
    end
  end
  puts current_longest_substring.length
end

longest_substring_with_k_distinct_characters("abcba", 2)



def longest_substring_with_k_distinct_characters(s, k)
  return 0 if k == 0

  # Keep a running window
  bounds = [0, 0]
  h = {}
  max_length = 0
  arr = s.split('')

  arr.each_with_index do |char, i|
    h[char] = i
    if h.count <= k
      new_lower_bound = bounds[0]
    else
      new_lower_bound = h.shift[1] + 1
    end

    bounds = [new_lower_bound, (bounds[1] + 1)]
    max_length = bounds[1] - bounds[0]
  end
  puts max_length
end

longest_substring_with_k_distinct_characters("abcba", 2)
