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

    it "holds invalid ids" do
      expect(shop.invalid_ids).to eq([])
    end

    describe "#invlalid_ids_sum" do
      it "calculates the sum of invalid ids" do
        expect(shop.invalid_ids_sum).to eq(0)

        shop.invalid_ids << 1
        shop.invalid_ids << 1

        expect(shop.invalid_ids_sum).to eq(2)
      end
    end

    describe "#find_invalid_ids" do
      it "finds all invalid ids in a range and adds them to invalid ids" do
        shop.find_invalid_ids(11..22)
        results = [11, 22]
        expect(shop.invalid_ids).to eq(results)

        shop.find_invalid_ids(95..115)
        results << 99
        expect(shop.invalid_ids).to eq(results)

        shop.find_invalid_ids(998..1012)
        results << 1010
        expect(shop.invalid_ids).to eq(results)

        shop.find_invalid_ids(1_188_511_880..1_188_511_890)
        results << 1_188_511_885
        expect(shop.invalid_ids).to eq(results)

        shop.find_invalid_ids(222_220..222_224)
        results << 222_222
        expect(shop.invalid_ids).to eq(results)

        shop.find_invalid_ids(1_698_522..1_698_528)
        expect(shop.invalid_ids).to eq(results)

        shop.find_invalid_ids(446_443..446_449)
        results << 446_446
        expect(shop.invalid_ids).to eq(results)

        shop.find_invalid_ids(38_593_856..38_593_862)
        results << 38_593_859
        expect(shop.invalid_ids).to eq(results)
      end
    end

    describe "#part_1_total" do
      it "adds all the invalid ids" do
        result = 1_227_775_554
        expect(shop.part_1_total).to eq(result)
      end
    end
  end
end
