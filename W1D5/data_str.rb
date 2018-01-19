class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
    added = false
    @map.each do |k|
      if k[0] == key
        k[1] = value
        added = true
        break
      end
    end
    unless added
      @map << [key,value]
    end
  end

  def lookup(key)
    @map.each {|el| return el[1] if el[0] == key}
  end

  def remove(key)
    @map.reject{|el| el[0] == key}
  end

  def show
    @map.dup
  end
end
