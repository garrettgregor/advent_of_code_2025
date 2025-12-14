# frozen_string_literal: true

class GiftShop
  attr_reader :inputs, :ranges, :part_2

  attr_accessor :invalid_ids

  def initialize(file_path, part_2: false)
    @inputs = File.open(file_path).flat_map { |line| line.split(",") }
    @invalid_ids = []
    @ranges = @inputs.map do |input|
      arr = input.split("-").map(&:to_i)
      Range.new(arr[0], arr[1])
    end
    @part_2 = part_2
  end

  def find_invalid_ids(range)
    range.each do |num|
      first_half = num.to_s[0..((num.to_s.length / 2) - 1)]
      second_half = num.to_s[((num.to_s.length / 2))..]

      @invalid_ids << num if first_half == second_half && !first_half.start_with?("0")
    end
  end

  def part_1_total
    @ranges.each { |range| find_invalid_ids(range) }

    @invalid_ids.sum
  end
end
