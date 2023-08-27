class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :votes, as: :voteable
end
