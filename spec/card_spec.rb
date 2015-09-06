require 'spec_helper'

describe Card do
  subject(:card) { Card.new :spades, :ace }
  it "has a suit and a rank" do
    expect(card.suit).to eql :spades
    expect(card.rank).to eql :ace
  end

  it "has a value corresponding to its rank" do
    expect(Card.new(:spades, :two).value).to eql 2
    expect(Card.new(:hearts, :two).value).to eql 2
    expect(Card.new(:spades, :ten).value).to eql 10
    expect(Card.new(:spades, :king).value).to eql 13
    expect(Card.new(:spades, :ace).value).to eql 14
  end

  it "can be represented as a readable string" do
    expect(card.to_s).to eq "Ace of Spades"
  end

  describe "when two cards are added together" do
    let(:other_card) { Card.new :clubs, :two }

    it "creates a deck containing the cards" do
      expect((card + other_card).cards).to eq [card, other_card]
      expect((other_card + card).cards).to_not eq  [card, other_card]
    end
  end

  describe "is comparable using its value"  do
    context "The cards have the same rank" do
      let(:other_card) { Card.new :clubs, :ace }
      
      it "does not compare suit" do
        expect(card).to be == other_card
      end

      it "allows greater than and less than" do
        expect(card).to be >= other_card
        expect(card).to be <= other_card
        expect(card).to_not be > other_card
        expect(card).to_not be < other_card
      end
    end
    context "The Cards have different ranks" do
      let(:other_card) { Card.new :clubs, :two }

      it "will be greater than a lower ranking card" do
        expect(card).to be > other_card
        expect(card).to be >= other_card
      end
      it "will be less than a higher ranking card" do
        expect(other_card).to be < card
        expect(other_card).to be <= card
      end
    end
  end
end