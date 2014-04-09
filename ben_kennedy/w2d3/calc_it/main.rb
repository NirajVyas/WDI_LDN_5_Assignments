require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'basic' then redirect to('/basic')
  when 'advanced' then redirect to('/advanced')
  when 'funky' then redirect to('/funky')
  # when 'celebrity' then redirect to('/celebrity')
  else redirect to('/')
  end
end

get '/basic' do
  @number1 = params[:number1].to_f
  @operator = params[:operator]
  @number2 = params[:number2].to_f

  case @operator
    when "+"
      @result = @number1 + @number2
    when "-"
        @result = @number1 - @number2
    when "*"
        @result = @number1 * @number2
    when "/"
        @result = @number1 / @number2
    end

  erb :basic
end

get '/advanced' do
  
  @number1 = params[:number1]
  @number2 = params[:number2]
  @number3 = params[:number3]
  
  if @number1 && @number2
    @result1 = @number1.to_f ** @number2.to_f
  end
  if @number3
    @result2 = Math.sqrt(@number3.to_f).round(2)
  end     
  erb :advanced
end

get '/funky' do
  erb :funky
end

# get '/celebrity' do
#   erb :celebrity
# end
