# frozen_string_literal: true

require "../spec_helper"
require "gift_shop"

RSpec.describe GiftShop do
  let(:file_path) { "./fixtures/example_1.txt" }
  let(:shop) { described_class.new(file_path) }

  describe "#initialize" do
    it "has inputs" do
      result = %w[
        11-22
        95-115
        998-1012
        1188511880-1188511890
        222220-222224
        1698522-1698528
        446443-446449
        38593856-38593862
        565653-565659
        824824821-824824827
        2121212118-2121212124
      ]

      expect(shop).to be_a(described_class)
      expect(shop.inputs).to eq(result)
    end
  end
end
