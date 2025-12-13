# frozen_string_literal: true

require "../spec_helper"
require "secret_entrance"

RSpec.describe SecretEntrance do
  let(:file_path) { "./fixtures/example_1.txt" }
  let(:secret) { described_class.new(file_path) }

  describe "#initialize" do
    it "has instructions" do
      result = %w[L68
                  L30
                  R48
                  L5
                  R60
                  L55
                  L1
                  L99
                  R14
                  L82]

      expect(secret).to be_a(described_class)
      expect(secret.instructions).to eq(result)
    end

    it "has a dial" do
      expect(secret.dial).to be_an(Array)
      expect(secret.dial.length).to eq(100)
      expect(secret.dial).to eq((0..99).to_a)
    end

    it "has a current value" do
      expect(secret.current_value).to eq(50)
    end

    it "has a current index" do
      expect(secret.current_index).to eq(50)
    end

    it "has a zero counter" do
      expect(secret.zero_counter).to eq(0)

      secret.zero_counter += 10

      expect(secret.zero_counter).to eq(10)
    end

    it "has a turns counter" do
      expect(secret.turns_counter).to eq(0)

      secret.turns_counter += 10

      expect(secret.turns_counter).to eq(10)
    end
  end

  describe "#move" do
    it "moves around the dial" do
      expect(secret.move("R", 97, 6)).to eq(3)
      expect(secret.move("R", 97, 106)).to eq(3)
      expect(secret.move("L", 6, 10)).to eq(96)
    end
  end

  describe "calculate_turns" do
    it "tracks when the dial has passed 0" do
      expect(secret.calculate_turns("R", 97, 6)).to eq(1)
      expect(secret.calculate_turns("R", 97, 106)).to eq(2)
      expect(secret.calculate_turns("R", 50, 50)).to eq(1)
      expect(secret.calculate_turns("L", 6, 10)).to eq(1)
      expect(secret.calculate_turns("L", 6, 99)).to eq(1)
      expect(secret.calculate_turns("L", 6, 206)).to eq(2)
      expect(secret.calculate_turns("L", 6, 200)).to eq(1)
      expect(secret.calculate_turns("R", 0, 100)).to eq(1)
      expect(secret.calculate_turns("R", 0, 1000)).to eq(10)
    end

    it "doesn't calculate when starting and ending at 0" do
      expect(secret.calculate_turns("R", 0, 100)).to eq(0)
      expect(secret.calculate_turns("L", 0, 100)).to eq(0)
    end

    it "doesn't calculate when ending at 0" do
      expect(secret.calculate_turns("L", 6, 6)).to eq(0)
    end

    it "doesn't track a 0 if it started there" do
      expect(secret.calculate_turns("R", 0, 5)).to eq(0)
      expect(secret.calculate_turns("L", 0, 5)).to eq(0)
    end

    it "counts turns" do
      expect(secret.calculate_turns("R", 50, 1000)).to eq(10)
    end
  end

  describe "#password" do
    it "calculates the number of times the dial was on 0" do
      expect(secret.password).to eq(3)
    end
  end

  context "with part 2" do
    let(:secret) { described_class.new(file_path, part_2: true) }

    describe "#password" do
      it "keeps track of all the times it has passed 0" do
        expect(secret.password).to eq(6)
      end
    end
  end
end
