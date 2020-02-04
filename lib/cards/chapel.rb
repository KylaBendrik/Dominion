require 'card'

  class Chapel < Card
    def initialize
      super('Chapel', 2)
    end
    
    def take_action
      #Trash up to 4 cards from your hand.
    end
  end