require './config/environment'
require 'pry'
class QuoteController < ApplicationController
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end 
      
     
      

       get '/quotes/:id' do 
         @quote = Quote.find_by(id: params[:id])
         
         @comments = @quote.comments
         current_user
         erb :"users/quoter"
      end
      
      
    

    get '/quote_list/:id' do

      @quote = Quote.find(params[:id])
      @user = User.find(session[:user_id])
      puts "this worked"
      @user_quote = UserQuote.create(quote:@quote, user:@user)
      
        redirect '/quote_list'
    end
    
    get '/quote_list' do
      @user = User.find(session[:user_id])
      @quote_list = @user.quotes
      erb :"/quotes/quote_list"
      end

      post '/quote_list/:id' do
        
      end
  
        
        
        get '/quote_list/delete/:id' do
        
         @quote = Quote.find(params[:id])
         @user = User.find(session[:user_id])
         @user.quotes.delete(@quote)
         
         redirect "/quote_list"
        end


        
      

      

    
   

    



          get '/users/index' do
            "hello"
          end
end