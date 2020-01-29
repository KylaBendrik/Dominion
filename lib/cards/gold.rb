require 'card'

  class Gold < Card
    def initialize
      super('Gold', 6)
    end

    def value
      3
    end
  end