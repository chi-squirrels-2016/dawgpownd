class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  def source_question
    case voteable_type
    when "Question"
      voteable
    when "Answer"
      voteable.question
    when "Comment"
      voteable.source_question
    else
      "Error"
    end
  end
end
