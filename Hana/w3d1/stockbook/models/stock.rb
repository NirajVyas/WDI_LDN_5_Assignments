class Stock < DBBase
  attributes symbol: :string,
             name: :string,
             buying_price: :decimal,
             holding: :integer,
             portfolio_id: :integer


  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @symbol = params['symbol']
    @name = params['name']
    @buying_price = params['buying_price']
    @holding = params['holding']
    @portfolio_id = params['portfolio_id']
  end


  def category
    stock.find(stock_id)   
  end
end