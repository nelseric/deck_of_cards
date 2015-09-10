require 'deck_of_cards/deck'

module DeckOfCards
  ##
  # Represents a playing card, with a suit, and a rank
  # Cards are compared based on their rank, but not their suit
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

    ##
    # Cards can be concatenated together to create a deck
    def +(other)
      if other.respond_to? :cards
        Deck.new [self] + other.cards
      else
        Deck.new [self, other].flatten
      end
    end

    def to_s
      "#{rank.capitalize} of #{suit.capitalize}"
    end
  end
end
