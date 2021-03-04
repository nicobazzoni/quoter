class Quote < ActiveRecord::Base
has_many :user_quotes
has_many :users, through: :user_quotes
has_many :comments

end
