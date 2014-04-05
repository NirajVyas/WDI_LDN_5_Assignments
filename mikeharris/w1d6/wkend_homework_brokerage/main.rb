require 'pry'
require 'yahoofinance'
require 'colorize'

require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'saved_stock_data'
require_relative 'menu'

$data_setting = false

stock_tickers = ["AAIT","AAL","AAME","ACFN", "ACTS", "GOOG"]

b = Brokerage.new('NYSE')
c1 = Client.new("Mike", "100000")
c2 = Client.new("Chris", "200000")
c3 = Client.new("Noor", "700000")

c1.buy_stock("AAL", 30, 100)
c1.buy_stock("AAME", 600, 90)
c2.buy_stock("GOOG", 500, 20)
c3.buy_stock("ACFN", 50, 20)

b.add_client(c1)
b.add_client(c2)
b.add_client(c3)

b.update_availiable_stocks(stock_tickers)
b.update_stock_data

response = menu.downcase

while response != "q"
  case response 
  when "1" 
    b.list_stock_prices
    pause
  when "2"
    log_on(b)
    pause
  when "3"
    b.list_clients
    create_client(b)
    pause
  when "s"
    settings
    b.update_availiable_stocks(stock_tickers)
    b.update_stock_data
  else 
    puts "Invlalid entry try again"
    pause  
  end 
  response = menu.downcase
end

