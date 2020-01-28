# frozen_string_literal: true

COIN_VALUE = {
  copper: 1,
  silver: 2,
  gold: 3,
  market: 1
}.freeze

CARD_COST = {
  copper: 0,
  silver: 3,
  gold: 6,
  estate: 2,
  village: 3,
  market: 5
}.freeze

PLAY_CARD = {
  village: lambda { |player|
    player.add_action(2)
    player.draw
  }
  market: lambda { |player|
    player.add_action
    player.draw
    player.calculate_coins
    player.add_buy
  }
}.freeze

class Player
  attr_reader :discard_pile, :draw_pile
  def initialize(name = 'NPC')
    # initialize instance variables
    @name = name
    @actions = 0
    @buys = 0
    @coins = 0
    @draw_pile = []
    @discard_pile = []
    @hand = []
    @in_play = []

    # fill in deck
    7.times { add_card(:copper, @draw_pile) }
    3.times { add_card(:estate, @draw_pile) }

    # shuffle deck
    @draw_pile = @draw_pile.shuffle

    # draw 5 cards
    draw(5)
  end

  def add_action(num = 1)
    @actions += num
  end

  def add_buy(num = 1)
    @buys += num
  end

  def add_card(card, location = @discard_pile)
    location.push(card)
  end

  def calculate_coins
    @coins = 0 # start at 0
    # count all the coins from cards in play and in hand, assign to @coins
    @hand.each do |card|
      if COIN_VALUE.include?(card)
        @coins += COIN_VALUE[card]
      end
    end
    @in_play.each do |card|
      if COIN_VALUE.include?(card)
        @coins += COIN_VALUE[card]
      end
    end
  end

  def discard(array_of_cards)
    array_of_cards.each do |card|
      @hand -= [card]
      @discard_pile.push(card)
    end
  end

  def display
    puts '-' * 30
    puts " - #{@name}"
    puts " - actions: #{@actions}"
    puts " - buy: #{@buys}"
    puts " - coins: #{@coins}"
    print ' - hand: '
    pp @hand
  end

  def draw(num = 1)
    num.times { @hand.push(@draw_pile.shift) }
  end

  def new_turn
    # prepare actions and buys
    @actions = 1
    @buys = 1
    draw_amount = 5
    calculate_coins
    display
    # play action cards until actions are spent or player moves on
    while @actions.positive?
      input = gets.chomp
      @actions -= 1
      display
    end
    # buy until coins are spent or player moves on
    calculate_coins
    # end turn
    discard(@hand)
    discard(@in_play)
    draw(draw_amount)
  end

  def play(card)
    @actions -= 1
    PLAY_CARD[card].call(self)
  end
end

beth = Player.new('Beth')
beth.new_turn
