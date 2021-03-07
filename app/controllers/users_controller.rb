require './config/environment'
require 'pry'

class UsersController < ApplicationController

  configure do
    set :views, 'app/views'
    set :public_folder, '/public'
    enable :sessions
    set :session_secret, "secret"
  end 

  get '/' do

    redirect "/signup"

  end

  get '/home' do
    @user = User.find(session[:user_id])
    erb :'/users/home'
  end

  get '/signup' do 
    erb :signup
  end
   
      
 
   post '/signup' do
    user = params["user"]
    if  params[:username] == "" || params[:password] == ""
      redirect '/failure'
    else
     puts params
      User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
      redirect '/login'
    end
    
   end

   get '/login' do
    
    erb :login
      
   end
    
   
    post '/login' do 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/welcome"
    else
      redirect to "/failure"
    end
   end




    get "/failure" do
      erb :failure
    end

    get "/logout" do
      session.clear
      redirect "/"
    end
  
    
  
    
   
  

  
get '/sessions/login' do

  # the line of code below render the view page in app/views/sessions/login.erb
  erb :'/login'
end

post '/sessions' do
  @user = User.find_by(email: params[:email], password: params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/users/home'
  end
  redirect '/sessions/login'
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end

get '/users/home' do

  @user = User.find(session[:user_id])
  erb :'/users/home'
end

    


    
  

    
    
    
    

    

   
    
  end
