require 'spec_helper'

describe Deck do
  subject(:deck) { Deck.new }
  context "A Brand new Deck" do
    it "has 52 cards" do
      expect(deck.size).to eq 52
    end
    it "has four suits" do
      expect(deck.cards.map(&:suit).uniq.length).to eq 4
    end
    it "has 13 ranks" do
      expect(deck.cards.map(&:rank).uniq.length).to eq 13
    end
  end

  describe "#shuffle" do
    it "returns a new deck with the cards in a different order" do
      expect(deck.cards).to eq Deck.new.cards
      expect(deck.shuffle.cards).to_not eq deck.cards
    end
  end

  describe "#draw" do
    it "draws a card off the top of the deck" do
      top = deck.cards.last
      expect(deck.draw).to eql [top]
    end

    it "can draw multiple cards at a time" do
      top = deck.cards.last(3)
      expect(deck.draw(3)).to eql top
    end
  end
  describe "#cut" do
    it "returns the bottom deck then top deck in an array" do
      bottom, top = deck.cut
      expect(bottom.cards.first).to eql deck.cards.first
      expect(top.cards.last).to eql deck.cards.last

      expect((bottom + top).cards).to eql deck.cards
    end

    context "The deck has an even number of cards" do
      it "returns two equal size decks" do
        bottom, top = deck.cut
        expect(top.size).to eq bottom.size
      end
    end

    context "The deck has an odd number of cards" do
      it "makes the top deck contain one more card than the bottom" do
        deck.draw
        bottom, top = deck.cut

        expect(top.size).to eq bottom.size + 1
      end
    end
  end

  describe "Card/Deck Addition/Concatenation" do
    let(:card) { Card.new(:tests, :ace) } # Ace of Tests!
    let(:other_deck) { Deck.new }

    it "concatenates the decks together" do
      expect((deck + other_deck).size).to eq 104
    end

    it "returns a new deck with the right deck on top of the left deck" do
      other = Deck.new [Card.new(:tests, :ace)] # Ace of Tests!

      expect((deck + other).cards.last).to eq other.cards[0]
    end

    context "When a card is added to the deck (D = D + C)" do
      it "puts the card to the top of the deck" do
        expect((deck + card).cards.last).to eq card
        expect((deck + card).cards.first).to eq deck.cards.first
      end
    end

    context "when a Deck is added to card (D = C + D)" do
      it "puts the card on the bottom of the deck" do
        expect((card + deck).cards.first).to eq card
        expect((card + deck).cards.last).to eq deck.cards.last
      end
    end
  end
end
