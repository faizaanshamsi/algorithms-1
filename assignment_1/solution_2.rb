require 'pry'
filename = './numbers.txt'
numbers = []
File.open(filename, 'r').each_line do |line|
  numbers << line.to_i
end

def sort_and_count(array)
  return array, 0 if array.length <= 1
  half = (array.length + 1) / 2
  left = array.take(half)
  right = array.drop(half)

  sorted_left, left_count = sort_and_count(left)
  sorted_right, right_count = sort_and_count(right)

  merged_array, split_count = merge_and_count(sorted_left, sorted_right)

  inversions = left_count + right_count + split_count

  return merged_array, inversions
end

def merge_and_count(left, right)
  sorted_array = []
  split_inversions = 0
  until left.empty? || right.empty?
    if left.first < right.first
      sorted_array << left.shift
    else
      sorted_array << right.shift
      split_inversions += left.length
    end
  end
  return sorted_array.concat(left).concat(right), split_inversions
end

puts sort_and_count(numbers)
