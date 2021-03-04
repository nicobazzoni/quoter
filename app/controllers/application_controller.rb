
require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_folder, '/public'
    enable :sessions
    set :session_secret, "secret"
  end 

   get '/' do
     "hello"
    end
   
   get '/quoter' do
    
    @quote = Quote.all[rand(0..Quote.all.count)]        
    @quote.quote
    redirect "/quotes/#{@quote.id}"       
    end

     
    helpers do
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        @current_user = User.find(session[:user_id])
      end
    end
  
end


  


