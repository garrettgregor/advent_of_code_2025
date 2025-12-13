# frozen_string_literal: true

class SecretEntrance
  attr_reader :instructions, :dial, :track_turns
  attr_accessor :zero_counter, :current_index, :turns_counter

  def initialize(file_path, part_2: false)
    @instructions = File.open(file_path).map(&:strip)
    @dial = (0..99).to_a
    @current_index = 50
    @zero_counter = 0
    @turns_counter = 0
    @track_turns = part_2
  end

  def current_value
    @dial[@current_index]
  end

  def calculate_turns(direction, current_index, distance) # rubocop:disable Metrics/MethodLength
    return 0 if current_index.zero?

    case direction
    when "L"
      subtracted_value = current_index - distance

      turns = if (current_index - distance).zero?
                0
              elsif (subtracted_value..current_index).cover?(0) && distance < @dial.length
                1
              else
                (current_index - distance).abs / @dial.length
              end

    when "R"
      turns = if (current_index + distance) == @dial.length - 1
                0
              else
                (current_index + distance) / @dial.length
              end
    end
    turns
  end

  def move(direction, current_index, distance)
    turns = calculate_turns(direction, current_value, distance)
    @turns_counter += turns if turns.positive?

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
      # puts "*" * 10
      # puts "Zeros: #{@zero_counter}"
      # puts "Turns: #{@turns_counter}"
      # puts "-" * 5
      # puts "Current Value: #{@current_index}"
      # puts "Instruction: #{instruction}"
      # puts "*" * 10
      direction = instruction[0]
      distance = instruction[1..].to_i
      @current_index = move(direction, current_value, distance)

      @zero_counter += 1 if current_value.zero?
    end

    @track_turns ? @zero_counter + @turns_counter : @zero_counter
  end
end
