require 'card'

class Smithy < Card
  def initialize
    super('Smithy', 4)
  end

  def take_action(player)
    player.draw_cards(3) # default is draw 1 card
    player.use_action # uses an action
  end
end