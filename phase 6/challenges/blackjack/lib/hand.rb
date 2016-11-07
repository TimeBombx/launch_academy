class Hand
  attr_reader :cards

  def initialize
    @cards = Array.new
  end

  def add_card(card)
    @cards << card
  end

  def add_cards(cards)
    cards.each { |card| add_card(card) }
  end

  def score
    face = ['J', 'Q', 'K']
    score = 0
    @cards.each do |card|
      score += 10 if face.any? { |face| card.rank == face }
      score += ace_score(score) if card.rank == 'A'
      score += card.display.to_i
    end
    score
  end

  private
    def ace_score(current_score)
      (current_score + 11 > 21) ? 1 : 11
    end
end
