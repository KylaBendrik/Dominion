# frozen_string_literal: true

COIN_VALUE = {
  copper: 1,
  silver: 2,
  gold: 3
}.freeze

CARD_COST = {
  copper: 0,
  silver: 3,
  gold: 6,
  estate: 2,
  village: 3
}.freeze

PLAY_CARD = {
  village: lambda { |player|
    player.add_action(2)
    player.draw(1)
  }
}.freeze

class Player
  attr_reader :discard_pile, :draw_pile
  def initialize
    # initialize instance variables
    @actions = 0
    @draw_pile = []
    @discard_pile = []
    @hand = []

    # fill in deck
    7.times { add_card(:copper, @draw_pile) }
    3.times { add_card(:estate, @draw_pile) }

    # shuffle deck
    @draw_pile = @draw_pile.shuffle

    # draw 5 cards
    draw(5)
  end

  def add_card(card, location = @discard_pile)
    location.push(card)
  end

  def draw(num = 1)
    num.times { @hand.push(@draw_pile.shift) }
  end
end

beth = Player.new
pp beth.draw_pile
