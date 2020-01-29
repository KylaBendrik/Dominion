# frozen_string_literal: true

puts 'Hello, welcome to Dominion file creator'
puts 'Please enter the Name of the Card'
name = gets.chomp
puts 'Please enter the Price of the Card'
price = gets.to_i
puts 'Please enter the Value of the Card'
value = gets.to_i
puts 'Please enter the Victory Points of the Card'
vps = gets.to_i
puts 'Please enter the Action of the Card'
take_action = gets.chomp

file_name = "#{name.downcase}.rb"

def save(file_name, name, price, value, vps, take_action)
  file_path = "./cards/#{file_name}"

  value_section = ''

  if value > 0
    value_section = "def value
      #{value}
    end"
  end

  points_section = ''

  if vps > 0
    points_section = "def vps
    #{vps}
  end"
  end

  ta_section = ''

  unless take_action.empty?
    ta_section = "def take_action
    #{take_action}
  end"
  end

  data = "require 'card'

  class #{name} < Card
    def initialize
      super('#{name}', #{price})
    end
    #{value_section} #{points_section} #{ta_section}
  end"

  File.open file_path, 'w' do |f|
    f.write data
  end
end

save(file_name, name, price, value, vps, take_action)
