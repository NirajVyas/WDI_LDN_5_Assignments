class Stock < DBBase

  attributes symbol: :string, name: :string, holding: :integer, current_price: :decimal, portfolio_id: :integer

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @symbol = params['symbol']
    @name = YahooFinance::get_standard_quotes(@symbol)[@symbol].name
    @holding = params['holding']
    @bought_price = YahooFinance::get_standard_quotes(@symbol)[@symbol].lastTrade
    prices = []
    @current_price = prices.last
    @portfolio_id = params['portfolio_id']

    # get_code = YahooFinance::get_standard_quotes('@symbol')['@symbol']

    # @name << get_code.name
    # prices << get_code.lastTrade
  end

  def category
    Category.find(category_id)
  end

  def current_value
    get_code = YahooFinance::get_standard_quotes('self.symbol')['self.symbol']
    @current_price << get_code.lastTrade
    @current_price.last
  end

end