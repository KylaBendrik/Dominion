# frozen_string_literal: true

require 'spec_helper'
require 'card_tool'

RSpec.describe CardTool do
  context 'when defining money cards' do
    let(:result) do
      <<~CODE
        # frozen_string_literal: true

        require 'card'

        class Copper < Card
          def initialize
            super('Copper', 0)
          end

          def value
            1
          end
        end
      CODE
    end

    it 'generates a class for copper' do
      expect(described_class.make_code('Copper', 0, value: 1)).to eq(result)
    end
  end

  context 'when defining point cards' do
    let(:result) do
      <<~CODE
        # frozen_string_literal: true

        require 'card'

        class Colony < Card
          def initialize
            super('Colony', 11)
          end

          def points
            10
          end
        end
      CODE
    end

    it 'generates a class for colony' do
      expect(described_class.make_code('Colony', 11, points: 10)).to eq(result)
    end
  end

  context 'when defining point/money cards' do
    let(:result) do
      <<~CODE
        # frozen_string_literal: true

        require 'card'

        class Harem < Card
          def initialize
            super('Harem', 6)
          end

          def points
            2
          end

          def value
            2
          end
        end
      CODE
    end

    it 'generates a class for Harem' do
      expect(described_class.make_code('Harem', 6, points: 2, value: 2)).to eq(result)
    end
  end

  context 'when defining action cards' do
    let(:result) do
      <<~CODE
        # frozen_string_literal: true

        require 'card'

        class Village < Card
          def initialize
            super('Village', 3)
          end

          # Add definition here
        end
      CODE
    end

    it 'generates a class for Village' do
      expect(described_class.make_code('Village', 3)).to eq(result)
    end
  end
end
