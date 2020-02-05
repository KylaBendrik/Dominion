class Card
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
    raise 'bad price' if price.negative?
    raise 'empty name' if name.empty?
  end

  def points
    # Victory Points
    0
  end

  def value
    # Treasures, or extra coins
    0
  end

  def take_action(*_args); end # Catch-all Method. Will add more later
end