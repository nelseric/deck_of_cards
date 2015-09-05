require 'spec_helper'

describe Deck do
  subject(:deck) { Deck.new }
  context "A Brand new Deck" do
    it "has 52 cards" do
      expect(deck.cards.length).to eq 52
    end
    it "has four suits" do
      expect(deck.cards.map(&:suit).uniq.length).to eq 4
    end
    it "has 13 ranks" do
      expect(deck.cards.map(&:rank).uniq.length).to eq 13
    end

    describe "#shuffle" do
      it "returns a new deck with the cards in a different order" do
        expect(deck.cards).to eq Deck.new.cards
        expect(deck.shuffle.cards).to_not eq deck.cards
      end
    end

  end
end