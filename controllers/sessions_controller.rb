require 'sinatra/base'

class SessionsController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions' do
    session[:name] = params[:name]
    redirect '/game'
  end
end
