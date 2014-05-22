require 'pry'
filename = 'QuickSort.txt'
numbers = []
File.open(filename, 'r').each_line do |line|
  numbers << line.to_i
end

def quicksort(array)
  if array.length <= 1
    return array
  end

  pivot = array.pop
  less = []
  more = []
  result = []

  array.each do |num|
    pivot > num ? less << num : more << num
  end

  result.concat(quicksort(less)).push(pivot).concat(quicksort(more))
end

puts quicksort(numbers)

#Need to refactor to in place implementation
#Count comparisons
