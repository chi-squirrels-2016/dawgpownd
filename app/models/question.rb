class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  belongs_to :accepted_answer, { class_name: "Answer" }
  has_many :taggings
  has_many :tags, through: :taggings

  validates :body, presence: true
  validates :title, presence: true
  validates :user_id, presence: true


  include Pointable

  def vote_count
    votes.length
  end

  def answer_count
    answers.length
  end

  def author
    user.username
  end

  def date
    created_at.strftime("%m/%d/%Y")
  end
end
