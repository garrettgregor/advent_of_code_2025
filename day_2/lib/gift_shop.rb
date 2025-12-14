# frozen_string_literal: true

class GiftShop
  attr_reader :inputs, :ranges, :part_2

  attr_accessor :invalid_ids

  def initialize(file_path, part_2: false)
    @inputs = File.open(file_path).flat_map { |line| line.split(",") }
    @invalid_ids = []
    @ranges = @inputs.map do |input|
      parts = input.split("-")
      Range.new(parts[0].to_i, parts[1].to_i)
    end
    @part_2 = part_2
  end

  def find_invalid_ids(range)
    (range.begin.to_s.length..range.end.to_s.length).each do |len|
      next unless len.even?

      generate_candidates_for_length(len, range)
    end
  end

  def generate_candidates_for_length(len, range)
    half_len = len / 2
    start_half = 10**(half_len - 1)
    end_half = (10**half_len) - 1
    find_valid_half_strings(start_half, end_half, range.begin, range.end)
  end

  def find_valid_half_strings(start_half, end_half, min, max)
    (start_half..end_half).each do |half|
      s = half.to_s
      full = (s + s).to_i
      break if full > max
      next if full < min

      @invalid_ids << full
    end
  end

  def part_1
    @ranges.each { |range| find_invalid_ids(range) }

    @invalid_ids.uniq.sum
  end
end
