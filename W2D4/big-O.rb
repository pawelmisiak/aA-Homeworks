

def sluggish_octopus(fish)
  biggest = ""
  fish.each do |fish1|
    fish.each do |fish2|
      if fish1 > fish2
        biggest = fish1
      end
    end
  end
  p biggest
end

def dominant_octopus(fish)
  return fish if fish.length <=1

  prc = Proc.new {|x,y| x.length <=> y.length}
  middle = fish.length / 2

  left = dominant_octopus(fish.take(middle))
  right = dominant_octopus(fish.drop(middle))

  merge(left,right,&prc)
end

def merge(left,right,&prc)
  arr = []
  until left.empty? || right.empty?
    case prc.call(left.first,right.first)
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

def nlogn(fish)
  p dominant_octopus(fish)[-1]
end

def clever_octopus(fish)
  longest = ""
  fish.each {|f| longest = f if f.length > longest.length}
  p longest
end


def slow_dance(step, tiles)
  tiles.each_with_index {|move,idx| return idx if move == step }
end

def constant_dance(step)
  tiles_hash = {"up" => 0, "right-up" => 1 , "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }
  return tiles_hash[step]
end



if __FILE__ == $PROGRAM_NAME
f = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
slow_dance("down",tiles_array)
p constant_dance("down")
end
