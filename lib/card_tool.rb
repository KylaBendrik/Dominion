# frozen_string_literal: true
def save(info)
  file_name = info[:file_name]
  name = info[:name]
  price = info[:price]
  value = info[:value]

# Functions used in generating card classes and files.
module CardTool
  def self.save(file_path, name, price, aspects)
    IO.write(file_path, make_code(name, price, aspects))
  end

  def self.make_code(name, price, aspects = {})
    custom_methods =
      aspects
        .map { |aspect, value| make_method(aspect, value) }
        .join("\n\n  ")

    <<~CODE
      # frozen_string_literal: true

      require 'card'

      class #{name} < Card
        def initialize
          super('#{name}', #{price})
        end

        #{custom_methods.empty? ? empty_comment : custom_methods}
      end
    CODE
  end

  def self.make_method(aspect, value)
    <<~CODE.chomp.gsub("\n", "\n  ")
      def #{aspect}
        #{value}
      end
    CODE
  end

  def self.empty_comment
    '# Add definition here'
  end

  private_class_method(:make_method, :empty_comment)
end
