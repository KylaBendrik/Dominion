require 'card'

class Cellar < Card
  def initialize
    super('Cellar', 2)
  end

  def take_action
    #+1 Action. Discard any number of cards, then draw that many.
  end
end