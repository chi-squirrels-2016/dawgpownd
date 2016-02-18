class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  validates :body, presence: true

  include Pointable

  def source_question
    if commentable_type == "Question"
      commentable
    else # must be an Answer
      commentable.question
    end
  end

  def author
    user.username
  end

end
