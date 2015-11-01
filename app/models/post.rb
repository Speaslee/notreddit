class Post < ActiveRecord::Base
  
  belongs_to :owner, class_name: "User"

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable


end
