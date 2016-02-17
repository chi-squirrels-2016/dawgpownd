class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  include Pointable

  def source_question
    if commentable.class.name == "Question"
      commentable
    else # must be an Answer
      commentable.question
    end
  end

end
