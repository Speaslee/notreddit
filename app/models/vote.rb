class Vote < ActiveRecord::Base
  belongs_to :posts
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
