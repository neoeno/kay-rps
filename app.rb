require 'sinatra'

class RPS < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/name' do
    @name = params[:name]
    "#{@name} plays the game!"
  end
end
