# frozen_string_literal: true

class SecretEntrance
  attr_reader :instructions, :dial
  attr_accessor :zero_counter, :current_value, :current_index

  def initialize(file_path)
    @instructions = File.open(file_path).map { |line| line.strip }
    @dial = (0..99).to_a
    @current_value = 50
    @current_index = @dial.index(@current_value)
    @zero_counter = 0
  end
end
