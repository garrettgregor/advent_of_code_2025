# frozen_string_literal: true

require "../spec_helper"
require "gift_shop"

RSpec.describe GiftShop do
  let(:file_path) { "./fixtures/example_1.txt" }
  let(:shop) { described_class.new(file_path) }

  describe "#initialize" do
    it "is a GiftShop" do
      expect(shop).to be_a(described_class)
    end

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

      expect(shop.inputs).to eq(result)
    end

    it "has ranges" do
      result = [
        11..22,
        95..115,
        998..1012,
        1_188_511_880..1_188_511_890,
        222_220..222_224,
        1_698_522..1_698_528,
        446_443..446_449,
        38_593_856..38_593_862,
        565_653..565_659,
        824_824_821..824_824_827,
        2_121_212_118..2_121_212_124
      ]

      expect(shop.ranges).to eq(result)
    end
  end
end
