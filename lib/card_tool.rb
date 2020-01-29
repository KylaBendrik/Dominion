# frozen_string_literal: true
def save(info)
  file_name = info[:file_name]
  name = info[:name]
  price = info[:price]
  value = info[:value]

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

info = {
  name: '',
  price: '',
  value: ''
}

puts 'Hello, welcome to Dominion file creator'

info.each do |key, value|
  print "Please enter the #{key} of the card: "
  if key == :name
    print "(Please capitalize!) "
  end
  info[key] = gets.chomp
end

info[:file_name] = "#{info[:name].downcase}.rb"
pp info


save(info)
