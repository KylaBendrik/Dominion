# frozen_string_literal: true

puts 'Hello, welcome to Dominion file creator'
puts 'Please enter the Name of the Card'
name = gets.chomp
puts 'Please enter the Price of the Card'
price = gets.chomp
puts 'Please enter the Value of the Card'
value = gets.chomp
file_name = "#{name.downcase}.rb"

def save(file_name, name, price, value)
  file_path = "./cards/#{file_name}"

  data = "require 'card'

  class #{name} < Card
    def initialize
      super('#{name}', #{price})
    end

    def value
      #{value}
    end
  end"

  File.open file_path, 'w' do |f|
    f.write data
  end
end

save(file_name, name, price, value)
