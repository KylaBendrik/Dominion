# frozen_string_literal: true

class Player
  attr_reader :discard_pile, :draw_pile
  def initialize(name)
    # initialize instance variables
    @name = name
    @actions = 0
    @buys = 0
    @coins = 0
    @draw_pile = []
    @discard_pile = []
    @hand = []
    @in_play = []

    # # fill in deck
    # 7.times { add_card(:copper, @draw_pile) }
    # 3.times { add_card(:estate, @draw_pile) }

    # shuffle deck
    @draw_pile = @draw_pile.shuffle

    # draw 5 cards
    draw_cards(5)
  end

  def dispatch(input)
    case input
    when 'exit'
      puts "Ending game!"
      exit
    when 'buy'
      puts "skipping action phase!"
      @actions = 0
    end
  end

  def draw_cards(num = 1)
    num.times { @hand.push(@draw_pile.shift) }
  end

end
