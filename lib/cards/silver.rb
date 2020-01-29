require 'card'

  class Silver < Card
    def initialize
      super('Silver', 3)
    end

    def value
      2
    end
  end