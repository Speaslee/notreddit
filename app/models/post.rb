class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  acts_as_taggable
  acts_as_taggable_on :tags
  has_many :votes, as: :votable
  has_many :comments, as: :commentable


end
