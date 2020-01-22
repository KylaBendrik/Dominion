class Player
  attr_reader :draw_pile, :discard_pile, :hand
  def initialize
    @draw_pile = []
    @discard_pile = []
    @hand = []
    7.times do 
      add_card(:copper)
    end
    3.times do
      add_card(:estate)
    end
    shuffle
    draw(5)
  end
  def draw(num = 1)
    # remove card from draw_pile
    # add same card to hand
    num.times do 
      @hand.push(@draw_pile.shift)
    end
  end
  def discard(card, num = 1)
    num.times do
      @discard_pile.push(card)
      @hand = @hand - [card]
    end
  end
  def shuffle
    # add better shuffle here
    @draw_pile = @discard_pile.shuffle
    @discard_pile.clear
  end
  def add_card(card_symbol, location = :discard)
    # by default, cards are added to the discard pile, but sometimes they are added to the draw pile
    @discard_pile.push(card_symbol)
  end
end

player = Player.new
puts " - draw pile"
puts player.draw_pile
puts " - discard pile"
puts player.discard_pile
puts " - hand"
puts player.hand