class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable
end
