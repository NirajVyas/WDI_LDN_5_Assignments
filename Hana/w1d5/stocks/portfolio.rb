require 'pry'

class Portfolio
  attr_accessor :name
  attr_reader :stocks

  def initialize(name)
   @name = name
   @stocks = {}  
  end

  def to_s
    if stocks.empty?
      "#{name} contains no stocks."
    else
      "#{name}: contains "
      binding.pry
    end
  end
end