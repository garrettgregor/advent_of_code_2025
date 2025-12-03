# frozen_string_literal: true

class SecretEntrance
  attr_reader :instructions, :dial
  attr_accessor :zero_counter, :current_index

  def initialize(file_path)
    @instructions = File.open(file_path).map(&:strip)
    @dial = (0..99).to_a
    @current_index = 50
    @zero_counter = 0
  end

  def current_value
    @dial[@current_index]
  end

  def move(direction, current_index, distance)
    case direction
    when "L"
      new_index = (current_index - distance) % @dial.length
    when "R"
      new_index = (current_index + distance) % @dial.length
    end
    new_index
  end

  def password
    instructions.each do |instruction|
      direction = instruction[0]
      distance = instruction[1..].to_i
      @current_index = move(direction, @current_index, distance)

      @zero_counter += 1 if current_value.zero?
    end
    # for each set of instructions
    # if it begins with R, add to the index up to the max
    # if it begins with L, subtract from the index up to the min
    # assess the ending value - if it is 0, add to the zero_counter
    @zero_counter
  end
end
