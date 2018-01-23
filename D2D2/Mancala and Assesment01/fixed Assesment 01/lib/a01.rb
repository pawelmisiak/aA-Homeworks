require 'byebug'
class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= Proc.new {|x,y| x<=>y}
    middle = self.length / 2
    left = self.take(middle).merge_sort(&prc)
    right = self.drop(middle).merge_sort(&prc)
    self.class.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    arr = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        arr << left.shift
      when 0
        arr << left.shift
      when 1
        arr << right.shift
      end
    end
    arr += left
    arr += right
  end


end

class Array
  # Write an array method that returns `true` if two elements of the array sum
  # to 0 and `false` otherwise
  def two_sum
    j = 0
    l = self.length
    (l-1).times do |i|
      j = l -1
      (l-1).times do
        if self[i] + self[j] == 0 && j > i
          return true
        end
        j-=1
      end
    end
    return false
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  # def my_flatten(level = nil)
  #   return self if self.length <= 1
  #   arr = []
  #   self.each do |el|
  #     if el.class == Array
  #       arr.concat(el.my_flatten(level = nil))
  #     else
  #       arr << el
  #     end
  #   end
  #   arr
  # end
  def my_flatten(level = nil)
    return self if level == 0
    array = []
    if !level.nil?
      deep = level
      i = 0
        while deep != 0
          if self[i].class == Array
            array.concat(self[i])
            deep -= 1
            return array
          else
            array << self[i]
            i+=1
          end
        end
    end

    self.my_each do |el|
      if el.class == Array
        # debugger
        array.concat(el.my_flatten)# [5, 6] => [5, 6]
        # [4] .concat[5, 6] => [4, 5, 6]
        # debugger
      else
        array << el
      end
      # debugger
    end
    array
  end
end

class String
  # Write a method that returns `true` if all characters in the string
  # are unique and `false` if they are not
  def all_unique_chars?
    arr = []
    self.each_char do |ch|
      if ch != " "
        arr << ch
      end
    end
    return true if arr == arr.uniq
    return false
  end
end

# Write a method that returns the largest prime factor of a number
def largest_prime_factor(num)
  if num < 2
    return nil
  end
  return num if prime?(num)


  selected = 0
  i = num -1
  while i > 0
    if num % i == 0 && prime?(i)
      selected = i
      break
    end
    i-=1
  end
  return 2 if num == 2

  selected

end

# You are not required to implement this; it's here as a suggestion :-)
def prime?(num)
  (2...num).none? {|el| num % el == 0}
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
    return self
  end
end

class Array
  # Write an array method that calls the given block on each element and
  # combines each result one-by-one with a given accumulator. If no accumulator is
  # given, the first element is used.
  def my_inject(accumulator = nil, &prc)
    i = 0
    if accumulator.nil?
      accumulator = self[0]
      i+=1
    end

    while i < self.length
      accumulator = prc.call(accumulator,self[i])
      i+=1
    end

    accumulator
  end
end
