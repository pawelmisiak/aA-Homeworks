require "byebug"

def sum_to(n)
  return nil if n < 0
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(arr)
  return 0 if arr.empty?
  first = arr.pop
  first + add_numbers(arr)
end

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2])
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.length < 1
  return true if favorite == flavors.pop
  ice_cream_shop(flavors, favorite)
end
