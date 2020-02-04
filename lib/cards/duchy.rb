require 'card'

  class Duchy < Card
    def initialize
      super('Duchy', 5)
    end
    
    def vps
      3
    end 
  end