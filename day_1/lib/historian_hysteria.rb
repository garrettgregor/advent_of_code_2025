# frozen_string_literal: true

class HistorianHysteria
  attr_reader :list, :left_list, :right_list

  def initialize(file_path)
    @list = File.open(file_path).map do |line|
      line.strip.split(/\D/).reject(&:empty?)
    end

    @left_list = list.map { |line| line[0].to_i }.sort
    @right_list = list.map { |line| line[1].to_i }.sort
  end

  # Returns a list of the differences between each correlated element between lists.
  def differences
    results = []

    left_list.each_with_index do |left_el, left_i|
      results << (left_el - right_list[left_i]).abs
    end

    results
  end

  # Returns the sum of the list of the differences between each correlated element between lists.
  def sum_of_differences
    differences.sum
  end

  # Returns the "similarity score" dictionary as defined by the number of times an element on the left list
  # appears on the right list
  def similarity_scores
    scores = {}

    left_list.each do |left_num|
      scores[left_num.to_s] = right_list.count(left_num) unless scores[left_num.to_s]
    end

    scores
  end

  # Returns a list of the left list elements multiplied by their corresponding "similarity scores".
  def multiplied_scores
    left_list.map do |left_num|
      left_num * similarity_scores[left_num.to_s]
    end
  end

  # Returns a sum of list of left list elements multiplied by their corresponding "similarity scores".
  def sum_of_multiplied_scores
    multiplied_scores.sum
  end
end
