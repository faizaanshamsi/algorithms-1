require 'pry'
filename = '10.txt'
numbers = []
File.open(filename, 'r').each_line do |line|
  numbers << line.to_i
end

def quicksort(array)
  if array.length <= 1
    return array, 0
  end


  pivot = array.shift
  comp = array.length

  less = []
  more = []

  array.each do |num|
    pivot > num ? less << num : more << num
  end

  sorted_less, less_comp = quicksort(less)
  sorted_more, more_comp = quicksort(more)

  return sorted_less.push(pivot).concat(sorted_more), less_comp + more_comp + comp
end

array, comp = quicksort(numbers)

puts array
puts comp

# 25, 608, 10272

#Need to refactor to in place implementation
#Count comparisons
# Answers are:
# size   first
# 10     25
# 100    615
# 1000   10297
