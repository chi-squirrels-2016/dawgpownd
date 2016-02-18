class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  def source_question
    case votable_type
    when "Question"
      votable
    when "Answer"
      votable.question
    when "Comment"
      votable.source_question
    else
      "Error"
    end
  end
end
