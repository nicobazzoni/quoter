require 'pry'
class CommentController < ApplicationController


    post '/comments' do
    

      

      quoter = {
          content: params[:content],
          user_id: session[:user_id], 
          quote_id: params[:quote_id] 
      }
         
       Comment.create(quoter)


      redirect "/quotes/#{params[:quote_id]}"
    
    end

    get '/comments/:id' do
     @quote = Quote.find(params[:id])
     @user = User.all[0]
     @user_quote = UserQuote.create(quote:@quote, user:@user)
   
     redirect '/comments'
    end
  
  

  delete '/comments/:id' do
    
   
    Comment.delete(params["id"])
  
    
    
    
    
    redirect "/quotes/#{params[:quote_id]}"
   end

end
 
  
     
   
   
