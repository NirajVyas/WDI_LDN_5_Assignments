require 'sinatra'
require 'yahoofinance'
get '/' do "<html><head><style> body{ text-align: center; background-color: #84D1E0; font-family: Helvetica; } .container, h1 {  background-color: white;  -webkit-border-radius: 20px;  -moz-border-radius: 20px;  border-radius: 20px;  border: 4px solid #69A7B3;  padding: 0px 40px;  font-size: 16px;  max-width:400px;  margin: 20px auto; } </style></head><body><h1>April's Top 10 Nasdaq 100 Stocks</h1><div class='container'><p>Stock #{YahooFinance::get_standard_quotes("VRTX")["VRTX"].name}, Price #{YahooFinance::get_standard_quotes("VRTX")["VRTX"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("AKAM")["AKAM"].name}, Price #{YahooFinance::get_standard_quotes("AKAM")["AKAM"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("BIIB")["BIIB"].name}, Price #{YahooFinance::get_standard_quotes("BIIB")["BIIB"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("MNST")["MNST"].name}, Price #{YahooFinance::get_standard_quotes("MNST")["MNST"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("AMGN")["AMGN"].name}, Price #{YahooFinance::get_standard_quotes("AMGN")["AMGN"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("NUAM")["NUAM"].name}, Price #{YahooFinance::get_standard_quotes("NUAN")["NUAN"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("ROST")["ROST"].name}, Price #{YahooFinance::get_standard_quotes("ROST")["ROST"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("LIFE")["LIFE"].name}, Price #{YahooFinance::get_standard_quotes("LIFE")["LIFE"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("NFLX")["NFLX"].name}, Price #{YahooFinance::get_standard_quotes("NFLX")["NFLX"].lastTrade}</p><p>Stock #{YahooFinance::get_standard_quotes("WYNN")["WYNN"].name}, Price #{YahooFinance::get_standard_quotes("WYNN")["WYNN"].lastTrade}</p><a href='/'>Update</a></div></body></html>" end
