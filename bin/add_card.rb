# frozen_string_literal: true

require_relative '../lib/card_tool'
require 'set'

types_aspects = {
  treasure: [:value],
  victory:  [:points],
  action:   [:action],
  reaction: [:action, :reaction]
}

puts 'Hello, welcome to Dominion file creator'
puts 'What kind(s) of card is it?: [treasure, victory, action, reaction]'
types = gets.chomp

if types.include? ','
  types = types.split(', ')
else
  types = [types]
end

aspects = Set[:name, :price]

types.each do |type|
  types_aspects[type.to_sym].each do |aspect|
    aspects.add(aspect)
  end
end

aspect_inputs = {}

aspects.each do |aspect|
  print "Please enter the #{aspect.to_s.upcase}:"
  aspect_inputs[aspect] = gets.chomp
end

pp aspect_inputs
# file_name = name.downcase.tr(' ', '_')
# file_path = File.expand_path("../lib/cards/#{file_name}.rb", __dir__)

# CardTool.save(file_path, name, price, value, vps, take_action)
