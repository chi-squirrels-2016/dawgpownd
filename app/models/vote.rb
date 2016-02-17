class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  def source_question
    case votable.class.name
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
