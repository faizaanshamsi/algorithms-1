require 'pry'
filename = 'QuickSort.txt'
numbers = []
File.open(filename, 'r').each_line do |line|
  numbers << line.to_i
end

def quicksort(array, comp = 0)
  comp += (array.length - 1)
  if array.length <= 1
    return array, 0
  end

  pivot = array.shift
  less = []
  more = []

  array.each do |num|
    pivot > num ? less << num : more << num
  end

  sorted_less, less_comp = quicksort(less, comp)
  sorted_more, more_comp = quicksort(more, comp)

  return sorted_less.push(pivot).concat(sorted_more), less_comp + more_comp + comp
end

array, comp = quicksort(numbers)

puts array
puts comp

#Need to refactor to in place implementation
#Count comparisons
