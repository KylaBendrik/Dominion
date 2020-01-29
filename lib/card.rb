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

  def take_action(*_args); end
end