
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
     erb :"/users/home"
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
    
    get '/welcome' do
      "hello world"
      @user = User.find(session[:user_id])
      erb :'users/welcome'
    end
  
    
      get '/edit' do
        "Hello World"
        @user = User.find(session[:user_id])
        erb :'/users/edit'
      end
   
      get "/users/:username" do
        @user = User.find_by(username:params[:username])
        if @user
          erb :"/users/edit"
        else 
          redirect '/'
        end
      end
      
      get "/users/:username/edit" do
        @user = User.find_by(username:params[:username])
        if @user && @user == current_user
          erb :"/users/welcome"
        else
          redirect '/'
        end
      end
      
      patch "/users/:username" do
        if params[:updated_username] == current_user.username
          
          redirect "/users/#{current_user.username}/edit"
        elsif User.find_by(username: params[:updated_username])
          
          redirect "/users/#{current_user.username}/edit"
        else
          user = User.find_by(username:params[:username])
          user.update(username:params[:updated_username])
          session[:username] = user.username
          redirect "/users/#{user.username}"
        end 
      end
      
      delete "/users/:username/delete" do
        redirect "/users"
      end
    
   
    
end


  


