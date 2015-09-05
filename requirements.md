# Deck of Cards

## Please code the following in Ruby:

A class that represents a standard deck of playing cards. The deck should be usable for a card game
that uses a single deck of cards and cards are dealt off of the top of the deck. Note that the deck
should default to an "Ace" being the highest Rank of card.

You should not use the Rails framework when solving this problem. Your work will be evaluated on
its functionality, implementation, and tests. We expect a suite of unit tests.

## Requirements
Your solution must provide a Deck that supports the following operations:

```ruby
deck = Deck.new
```

### Shuffle
A Deck should have a shuffle method that returns a Deck in random order:

```ruby
deck.shuffle
```

### Draw n number of cards off the top

```ruby
deck.draw.inspect # => ["Ace of Spades"]

deck.draw(3).inspect # => ["8 of Clubs", "10 of Hearts", "Jack of Spades"]
```

### Cards must be comparable by rank, (cards are not ranked by suit):

```ruby
deck.draw > deck.draw # => true or false

deck.draw < deck.draw # => true or false

deck.draw >= deck.draw # => true or false

deck.draw <= deck.draw # => true or false

deck.draw == deck.draw # => true or false
```

### Cut
Cut a deck exactly in half into 2 new decks.

```ruby
deck.cut # => Two Decks whose length is deck.length / 2
```
