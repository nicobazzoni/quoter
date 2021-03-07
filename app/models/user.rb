class User < ActiveRecord::Base
  validates :name, :username, :email, presence: true
  
  
  has_many :user_quotes 
  has_many :quotes, through: :user_quotes
  has_many :comments 
  has_many :posts, through: :user_quotes
  
  has_secure_password
  
 
end