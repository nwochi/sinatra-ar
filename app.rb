require "sinatra"
  require "sinatra/reloader"
  require "sinatra/activerecord"
  set :database, { adapter: "sqlite3", database: "mydb.db" }
require '/.model/user'

get '/new' do
  erb :user_form
end

get '/remove' do
  erb :user_delete
end

post '/create' do
  user = User.new
  user.name = [params:name]
  user.email = [params:email]
  user.save
  "User Created. id: #{user.id} name: #{user.name} email: #{user.email}"
  
post '/delete' do
  user = User.find_by(name: params [:name])
  if !user.nil?
    user.destroy
    "user #{params [:name]} deleted"
  else
    "user #{params [:name]} not found"
  end
end
  