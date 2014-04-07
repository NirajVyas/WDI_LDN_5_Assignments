require 'pry'

class Client
  attr_accessor :name, :opening_balance, :portfolios

  def initialize(name, opening_balance)
    @name = name
    @opening_balance = opening_balance
    @portfolios =  { }
  end

  def Client.create_user
    puts " "
    puts "What is the new client's name?"
    name = gets.chomp.to_sym
    puts " "
    puts "What is #{name}'s opening balance?"
    opening_balance = valid_number_input.to_i
    return Client.new(name, opening_balance)
    puts " "
    puts "A new user has been created"
    puts " "

  end

  def list_portfolios
   
    if portfolios != { }
      portfolios.keys.join("\n")
    else 
      "You have no portfolios!"
    end
  end

end
