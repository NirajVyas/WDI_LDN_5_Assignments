require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'todo_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  sql_list = "select * from todo"

  @todos = @db.exec(sql_list)

  erb :list_todos
end

get '/new' do
  erb :new_todo
end

post '/create' do
  title = params[:title]
  description = params[:description]
  deadline = params[:deadline]
  
  sql_entry = "insert into todo (title, description, deadline, status, created_on) values (#{sql_string(title)}, #{sql_string(description)}, #{sql_string(deadline)}, 'Current', current_timestamp)"

  @db.exec(sql_entry)
  
  redirect to('/')
end

get '/edit/:id' do
  id = params[:id]
  sql_list = "select * from todo where id=#{id}"
  @todos = @db.exec(sql_list)

  erb :edit
end

post '/post/:id' do
  id = params[:id]
  title = params[:title]
  description = params[:description]
  deadline = params[:deadline]
  status = params[:status]

  sql = "update todo set title=#{sql_string(title)}, description=#{sql_string(description)}, deadline=#{sql_string(deadline)}, status=#{sql_string(status)}, updated_on=current_timestamp where id=#{id}"
  @db.exec(sql)
  redirect to('/')
end

post '/delete/:id' do
  sql = "delete from todo where id = #{params[:id]}"
  @db.exec(sql)
  redirect to('/')
end

def sql_string(value)
  "'#{value.gsub("'", "''")}'"
end
class String
  def t_format
    self[0,16]
  end
end