require 'sinatra'

class RPS < Sinatra::Base
  get '/' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions' do
    @name = params[:name]
    erb :name
  end
end
