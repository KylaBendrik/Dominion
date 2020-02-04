require 'card'

class Workshop < Card
  def initialize
    super('Workshop', 3)
  end
  
  def take_action
    # Gain a card costing up to 4 Coins
  end
end