class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
      system('clear')
    end
    if game_over
      game_over_message
      sleep 1
      system("clear")
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message if !@game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 1
    end
  end

  def require_sequence
    puts "Repeat the colors, enter first letter of each color"
    @seq.each do |color|
      entered_color = gets.chomp
      if entered_color != color[0]
        @game_over = true
        break
      end
      sleep 1
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Great!"
  end

  def game_over_message
    puts 'Game over. Try again!'
  end

  def reset_game
    initialize
    play
  end
end

game = Simon.new
game.play
