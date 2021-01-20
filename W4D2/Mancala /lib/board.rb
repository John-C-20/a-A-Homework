require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1_name = name1
    @player2_name = name2

    @cups = Array.new(14) {Array.new(4, :stone)}
    cups[6] = []
    cups[13] = []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,5) || start_pos.between?(7,12) 
    raise "Starting cup is empty" if cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    current_player_name == @player1_name ? player1 = true : player1 = false
    stones = cups[start_pos].count
    cups[start_pos] = []
    index = nil
    opp_cup_offset = 0

    stones.times do |i|
      index = (start_pos + 1 + i + opp_cup_offset) % 14
      if player1 && index == 13 
        index = 0
        opp_cup_offset += 1
      elsif !player1 && index == 6
        index = 7
        opp_cup_offset += 1
      end
      cups[index] << :stone
    end

    render
    next_turn(index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].count == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    count = 0
    (0..5).each { |cup| count += 1 if cups[cup].empty? }
    return true if count == 6
    (7..12).each { |cup| return false unless cups[cup].empty? }
    true
  end

  def winner
    case cups[6].count <=> cups[13].count
    when 0
      return :draw
    when -1
      return @player2_name
    else
      return @player1_name
    end
  end
end
