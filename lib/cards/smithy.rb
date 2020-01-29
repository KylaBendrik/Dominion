class Smithy < Card
  def initialize
    super('Smity', 4)
  end

  def take_action(player)
    player.draw_cards(3)
    player.use_action
  end
end