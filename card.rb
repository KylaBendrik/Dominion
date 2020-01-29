class Card
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
    raise 'bad price' if price.negative?
    raise 'empty name' if name.empty?
  end

  def points
    0
  end

  def value
    0
  end
end

class Copper < Card
  def initialize
    super('Copper', 0)
  end

  def value
    1
  end
end

class Estate < Card
  def initialize
    super('Estate', 2)
  end

  def points
    1
  end
end

class Smithy < Card
  def initialize
    super('Smity', 4)
  end

  def perform(player)
    player.draw_cards(3)
  end
end