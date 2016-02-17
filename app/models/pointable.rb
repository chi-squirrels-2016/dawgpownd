module Pointable
  def points
    votes.sum(:value)
  end
end
