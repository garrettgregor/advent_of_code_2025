# frozen_string_literal: true

class SecretEntrance
  attr_reader :instructions, :dial, :current_value, :starting_index
  attr_accessor :zero_counter

  def initialize(file_path)
    @instructions = File.open(file_path).map { |line| line.strip }
    @dial = (0..99).to_a
    @current_value = 50
    @starting_index = @dial.index(@current_value)
    @zero_counter = 0
  end
end
