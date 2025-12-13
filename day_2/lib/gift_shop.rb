# frozen_string_literal: true

class GiftShop
  attr_reader :inputs, :part_2

  def initialize(file_path, part_2: false)
    @inputs = File.open(file_path).flat_map { |line| line.split(",") }
    @part_2 = part_2
  end
end
