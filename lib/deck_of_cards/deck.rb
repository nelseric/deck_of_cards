require 'deck_of_cards/card'

require 'pry'

module DeckOfCards
  ##
  # This class represents a deck of cards, with array-like operations
  # commonly used in card game.
  #
  # Every action on a deck is immutable, except for drawing a card.
  #
  # optional argument:
  #   `cards` can be used to inialize the deck to any array of cards
  class Deck
    extend Forwardable

    attr_reader :cards

    def_delegators :@cards, :size, :length

    def initialize(cards = nil)
      @cards = cards || Deck.full_deck
    end

    def draw(n = 1)
      cards.pop n
    end

    def shuffle
      Deck.new cards.shuffle
    end

    ##
    # Split the deck into two even sized decks
    # When the deck has an odd nuber of cards,
    #  the top half will have one more card
    def cut
      bottom_size = cards.length / 2 # Integer division
      top_size = cards.length - bottom_size

      bottom = cards.first bottom_size
      top = cards.last top_size
      [Deck.new(bottom), Deck.new(top)]
    end

    ##
    # A deck, a card, or an array of cards can be concatenated to any deck
    def +(other)
      if other.respond_to? :cards
        Deck.new cards + other.cards
      else
        Deck.new cards + [other].flatten
      end
    end

    ##
    # The creates an array of cards for a standard 52 card french deck
    def self.full_deck
      Card::SUITS.product(Card::RANKS.keys).map do |suit, rank|
        Card.new suit, rank
      end
    end
  end
end
