# frozen_string_literal: true

require "./lib/secret_entrance"

PATH = "./fixtures/puzzle_input_1.txt"
puzzle = SecretEntrance.new(PATH)

puts "Part 1: #{puzzle.password}"
