class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :body, presence: true

  include Pointable

  def author
    user.username
  end

  def vote_count
    votes.length
  end
end
