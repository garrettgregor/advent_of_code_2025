# frozen_string_literal: true

require "../spec_helper"
require "secret_entrance"

RSpec.describe SecretEntrance do
  describe "#initialize" do
    let!(:file_path) { "./fixtures/example_1.txt" }
    let!(:secret) { described_class.new(file_path) }

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
    it "has a starting index" do
      expect(secret.starting_index).to eq(50)
    end
    it "has a zero counter" do
      expect(secret.zero_counter).to eq(0)
    end
  end
end
