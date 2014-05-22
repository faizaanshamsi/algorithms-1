require 'pry'

array = [1,2,3]
array2 = []
array.each do |x|
  array2 << x ** 2
  binding.pry
end

