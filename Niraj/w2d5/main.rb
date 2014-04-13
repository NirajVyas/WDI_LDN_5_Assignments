require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do
    @db = PG.connect(:dbname =>'movie', :host => 'localhost')
end

after do
    @db.close
end

get '/' do
  redirect '/show'
end

get '/new' do
  erb :new
end

post '/create' do
  @title = params[:title]
  @description = params[:description]
  @genre = params[:genre]
  @youtubeID = params[:youtubeID]
  @movie = params[:movie]

  sql = "insert into movie (title, description, genre, youtubeID) values('#{@title}', '#{@description}', '#{@genre}', '#{@youtubeID}')"
  @db.exec(sql)

  redirect to ('/show')
end

get '/show' do
  sql = "select * from movie"
  @movie = @db.exec(sql)

  erb :show
end

get '/edit/:id' do
  @youtubeID = params[:youtubeID]
  id = params[:id]
  sql = "select * from movie"
  @movie = @db.exec(sql)

  @movie.each do |item|
    if item["id"] == @id
      @item_to_edit = item
    end
  end

  erb :edit
end

post '/update/:id' do
  @id = params[:id]
  @title = params[:title]
  @description = params[:description]
  @genre = params[:genre]
  @youtubeID = params[:youtubeID]

  sql ="update movie set title= #{sql_string(@title)}, description=#{sql_string(@description)}, genre=#{sql_string(@genre)}, youtubeID=#{sql_string(@youtubeID)} where id = #{@id}"

  @db.exec(sql)

  redirect to ('/show')
end

get '/delete/:id' do
  sql = "delete from movie where id = #{params[:id]}"
  @db.exec(sql)
  redirect to ('/show')
end



def sql_string(value)
"'#{value.gsub("'", "''")}'"

end






