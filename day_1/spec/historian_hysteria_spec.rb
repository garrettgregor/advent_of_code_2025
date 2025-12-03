# frozen_string_literal: true

require "../spec_helper"
require "historian_hysteria"

RSpec.describe HistorianHysteria do
  describe "#initialize" do
    let!(:file_path) { "./fixtures/example_1.txt" }
    let!(:historian) { described_class.new(file_path) }

    it "starts with a list" do
      list = [%w[3 4], %w[4 3], %w[2 5], %w[1 3], %w[3 9], %w[3 3]]

      expect(historian).to be_a(described_class)
      expect(historian.list).to eq(list)
    end

    it "has a left list and a right list that are each sorted" do
      left_list = [1, 2, 3, 3, 3, 4]
      right_list = [3, 3, 3, 4, 5, 9]

      expect(historian.left_list).to eq(left_list)
      expect(historian.right_list).to eq(right_list)
    end
  end

  describe "instance_methods" do
    context "when solving part 1" do
      let!(:file_path) { "./fixtures/example_1.txt" }
      let!(:historian) { described_class.new(file_path) }

      describe "#differences" do
        it "creates a list of the differences between the two lists" do
          differences = [2, 1, 0, 1, 2, 5]

          expect(historian.differences).to eq(differences)
        end
      end

      describe "#sum_of_differences" do
        it "returns a sum of all the differences added together" do
          sum = 11

          expect(historian.sum_of_differences).to eq(sum)
        end
      end
    end

    context "when solving part 2" do
      let!(:file_path) { "./fixtures/example_2.txt" }
      let!(:historian) { described_class.new(file_path) }

      describe "#similarity_scores" do
        it "creates a hash of the similarity scores" do
          scores = { "1" => 0, "2" => 0, "3" => 3, "4" => 1 }

          expect(historian.similarity_scores).to eq(scores)
        end
      end

      describe "#multiplied_scores" do
        it "creates a list after multiplying each element on the left list by its similarity score" do
          multiplied_scores = [9, 4, 0, 0, 9, 9]

          expect(historian.multiplied_scores).to match_array(multiplied_scores)
        end
      end

      describe "#sum_of_multiplied_scores" do
        it "adds up the list created by #multiplied_scores" do
          sum_of_multiplied_scores = 31

          expect(historian.sum_of_multiplied_scores).to eq(sum_of_multiplied_scores)
        end
      end
    end
  end
end
