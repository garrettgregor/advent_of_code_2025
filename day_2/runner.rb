# frozen_string_literal: true

require "./lib/gift_shop"

PATH = "./fixtures/puzzle_input_1.txt"
puzzle = GiftShop.new(PATH)

puts "Part 1: #{puzzle.part_1}"
