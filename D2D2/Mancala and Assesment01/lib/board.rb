require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @current_player_name = name1
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |a,idx|
      if idx != 6 && idx != 13
        4.times do
          a << :stone
        end
      end
    end

  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 13
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones_hold = @cups[start_pos]
    @cups[start_pos] = []
    current_cup = start_pos + 1
    until stones_hold.empty?
      if @current_player_name == @name1 && current_cup == 13
        current_cup = 0
      elsif @current_player_name == @name2 && current_cup == 6
        current_cup += 1
      end
      @cups[current_cup] << stones_hold.pop
      current_cup += 1
      current_cup = 0 if current_cup == 13
    end

    render
    next_turn(current_cup)


  end

  def next_turn(ending_cup_idx)

    if @cups[ending_cup_idx] == []
      :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    else
    ending_cup_idx
    end

  end



  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
