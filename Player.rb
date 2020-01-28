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
  village: lambda do
             add_action(2)
             draw(1)
           end
}.freeze

class Player
  attr_reader :draw_pile, :discard_pile, :hand, :actions
  def initialize
    @draw_pile = []
    @discard_pile = []
    @hand = []
    @actions = 0
    7.times do
      add_card(:copper)
    end
    3.times do
      add_card(:estate)
    end
    shuffle
    draw(5)
  end

  def new_turn
    @actions = 1
    display_state
    # do stuff
    @hand.each do |card|
      discard(card)
    end
    draw(5) # players should have 5 cards in their hand, even when it's not their turn
  end

  def display_state
    puts '-' * 30
    puts 'hand:'
    pp @hand
    puts "coins: #{coins_available}"
    puts "actions: #{@actions}"
  end

  def draw(num = 1)
    # remove card from draw_pile
    # add same card to hand
    num.times do
      @hand.push(@draw_pile.shift)
    end
  end

  def discard(card)
    @discard_pile.push(card)
    @hand -= [card]
  end

  def shuffle
    # add better shuffle here
    @draw_pile = @discard_pile.shuffle
    @discard_pile.clear
  end

  def add_card(card_symbol, _location = :discard)
    # by default, cards are added to the discard pile, but sometimes they are added to the draw pile
    @discard_pile.push(card_symbol)
  end

  def add_action(num = 1)
    @actions += num
  end

  def play(card_symbol)
    # lookup card action in above hash ^
    PLAY_CARD[card_symbol].call
    display_state
  end

  def coins_available
    total = 0
    @hand.each do |card|
      total += COIN_VALUE[card] if COIN_VALUE.include?(card)
    end
    total
  end

  def use_action(_num = 1)
    @actions -= 1
  end

  def buy(card_symbol)
    add_card(card_symbol) if coins_available > CARD_COST[card_symbol]
  end
end

player = Player.new
