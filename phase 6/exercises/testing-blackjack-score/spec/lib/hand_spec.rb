require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new(["10♦", "J♥"]) }
  # You can add more sample hands

  describe "#calculate_hand" do
    # We have included some example tests below. Change these once you get started!

    # Add your remaining tests here.
    it 'should calculate correct score' do
      expect(hand.calculate_hand).to eq(20)
    end
  end
end
