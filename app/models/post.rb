class Post < ActiveRecord::Base

  belongs_to :user

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable


end
