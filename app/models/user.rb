class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :answers
  has_many :comments
  has_many :votes
  has_many :questions


end
