class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  belongs_to :accepted_answer, { class_name: "Answer" }
  has_many :taggings
  has_many :tags, through: :taggings

  include Pointable
end
