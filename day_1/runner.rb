# frozen_string_literal: true

require "./lib/historian_hysteria"

PATH = "./fixtures/puzzle_input_1.txt"
historian = HistorianHysteria.new(PATH)

puts "Part 1: #{historian.sum_of_differences}"
puts "Part 2: #{historian.sum_of_multiplied_scores}"
