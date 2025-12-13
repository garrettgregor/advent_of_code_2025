# frozen_string_literal: true

class GiftShop
  attr_reader :inputs, :ranges, :part_2

  attr_accessor :invalid_id_sum, :invalid_ids

  def initialize(file_path, part_2: false)
    @inputs = File.open(file_path).flat_map { |line| line.split(",") }
    @invalid_ids = []
    @invalid_id_sum = 0
    @ranges = @inputs.map do |input|
      arr = input.split("-").map(&:to_i)
      Range.new(arr[0], arr[1])
    end
    @part_2 = part_2
  end
end
