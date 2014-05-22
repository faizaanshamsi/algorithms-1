require 'pry'
filename = 'QuickSort.txt'
numbers = []
File.open(filename, 'r').each_line do |line|
  numbers << line.to_i
end

def median_of_three(array)
  first = array.first
  last = array.last
  median = array[(array.length - 1) / 2]
  Array.new.push(first).push(last).push(median).sort[1]
end

def quicksort(array)
  if array.length <= 1
    return array
  end

  pivot = array.delete(median_of_three(array))
  less = []
  more = []
  result = []

  array.each do |num|
    pivot > num ? less << num : more << num
  end

  result.concat(quicksort(less)).push(pivot).concat(quicksort(more))
end

# puts median_of_three(numbers)
puts quicksort(numbers)


#Need to refactor to in place implementation
#Count comparisons
