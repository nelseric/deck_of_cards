require 'deck_of_cards/card'

require 'pry'

module DeckOfCards
  class Deck
    extend Forwardable

    attr_reader :cards

    def initialize(cards = nil)
      @cards = cards || Deck.full_deck
    end

    def draw(n = 1)
      cards.pop n
    end

    def shuffle
      Deck.new cards.shuffle
    end

    def +(other)
      if other.respond_to? :cards
        Deck.new cards + other.cards
      else
        Deck.new cards + [other].flatten
      end
    end

    private

    def self.full_deck
      Card::SUITS.product(Card::RANKS.keys).map { |suit, rank| Card.new suit, rank }
    end
  end
end
