class Client
  attr_accessor :name
  attr_reader :portfolio
  attr_writer :money

  def initialize(name, money)
    @name = name
    @money = money.to_f
    @portfolio = {}
  end

  def show_money
    @money   
  end

  
 def buy_stock(stock_ticker, stock_price, nos_shares)
    if portfolio[stock_ticker]        
        portfolio[stock_ticker].buy_more_shares(stock_price, nos_shares)       
        # portfolio[stock_ticker][:price] = (portfolio[stock_ticker][:price] *  portfolio[stock_ticker][:nos]  + stock_price*nos_shares) / (portfolio[stock_ticker][:nos] + nos_shares)
        # portfolio[stock_ticker][:nos] += nos_shares
    else
        t = Trade.new(stock_ticker, stock_price, nos_shares)
        portfolio[stock_ticker] = t
    end
    
    @money = @money - stock_price * nos_shares

  end

  def list_portfolio
    @portfolio
  end  

end
