require "spec_helper"

RSpec.describe Hand do
  deck = Deck.new

  it 'can add to hand' do
    hand = Hand.new
    hand.add_cards deck.deal(1)
    expect(hand.cards.size).to eq(1)
  end

  it 'calculates correct score' do
    hand = Hand.new
    hand.add_card(Card.new(2, '♣'))
    hand.add_card(Card.new('K', '♣'))
    expect(hand.score).to eq(12)
  end
end
