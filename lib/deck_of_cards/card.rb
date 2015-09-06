require 'deck_of_cards/deck'

module DeckOfCards
  class Card
    SUITS = [
      :spades,
      :clubs,
      :hearts,
      :diamonds
    ]
    RANKS = {
      two:   2,
      three: 3,
      four:  4,
      five:  5,
      six:   6,
      seven: 7,
      eight: 8,
      nine:  9,
      ten:   10,
      jack:  11,
      queen: 12,
      king:  13,
      ace:   14
    }

    include Comparable

    attr_reader :suit, :rank
    def initialize(suit, rank)
      @suit = suit
      @rank = rank
    end

    def value
      RANKS[rank]
    end

    def <=>(other)
      value <=> other.value
    end

    def +(other)
      if other.respond_to? :cards
        Deck.new other.cards.unshift self
      else
        Deck.new [self, other]
      end
    end

    def to_s
      "#{rank.capitalize} of #{suit.capitalize}"
    end
  end
end
