item_array = ['bed', 'pillow', 'bed', 'pillow', 'table', 'bed', 'pillow', 'door', 'light', 'minibar', 'light', 'chair', 'chair', 'light', 'light', 'hairdryer', 'soap']

item_array.sort!

# Ruby 2.7 introduced a method 'tally' that'll count the strings in array and returns a hash.

# first approach

puts item_array.reverse.tally

# second approach

result = {}

item_array.reverse_each do |item|
  result.dig(item).nil? ? result[item] = 1 : result[item] = result[item] + 1
end

puts result
