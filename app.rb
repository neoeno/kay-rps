require 'sinatra/base'
require_relative './controllers/game_controller'
require_relative './controllers/sessions_controller'

class ApplicationController < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/sessions/new'
  end

  use SessionsController
  use GameController

  run! if app_file == $0
end
