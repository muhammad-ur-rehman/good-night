class User < ApplicationRecord
  has_many :sleep_records
  has_many :friendships, foreign_key: :follower_id
  has_many :followed_users, through: :friendships, source: :followed
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :followed_id
  has_many :followers, through: :inverse_friendships, source: :follower
end