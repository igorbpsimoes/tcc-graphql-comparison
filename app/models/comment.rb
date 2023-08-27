class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  has_many :votes, as: :voteable
end
