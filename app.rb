# frozen_string_literal: true

require "bundler/setup"
require "sinatra/base"
require "sinatra/multi_route"
require "sinatra/reloader"
require "sinatra/cookies"
require "private_address_check"

module AuthService
  # Sinatra app to perform authentication related user actions, and things
  class App < Sinatra::Base
    configure do
      register Sinatra::MultiRoute
      enable :sessions
      enable :logging
    end

    configure :development do
      # This is development
      require "pry"
      set :port, 4568
      set :host, "http://localhost:4568"
      register Sinatra::Reloader
      enable :dump_errors, :raise_errors
    end

    configure :production do
      set :raise_errors, false
      set :show_exceptions, false
    end

    get "/check/:address" do
      { resp: PrivateAddressCheck.private_address?(params[:address]) }.to_json
    end
    run! if app_file == $PROGRAM_NAME
  end
end
