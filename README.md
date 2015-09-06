# DeckOfCards

DeckOfCards is an implementation of a playing card deck in ruby.

By default it will initialize with a full 52 card french deck.

It is possible to implement other deck types, by initializing deck with an array of cards you want to use.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deck_of_cards'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deck_of_cards

## Usage
```ruby
# This will include the DeckOfCards module
require 'deck_of_cards'

# If you don't want to do that, you can require individual parts like follows
require 'deck_of_cards/deck'
# And use 
DeckOfCards::Deck

# 52 card standard deck
deck = Deck.new 

# shuffle returns a new deck instance
deck = deck.shuffle

# Split the top and bottom halves of the deck
bottom, top = deck.cut

# Deck concatenation is ordered, so this is how someone would stack a cut deck
deck = top + bottom 

# Draw five cards from the deck into an array
hand = deck.draw(5) 

# A new deck can be build by passing an array of cards to deck initialization
discard_deck = Deck.new hand

# Put the discarded cards back on the deck
deck = discard_deck + deck

# Look at the top card of the deck
card = deck.draw # draw one card by default
deck = deck + card # put the card back

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/nelseric/deck_of_cards](https://github.com/nelseric/deck_of_cards).

