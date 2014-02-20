module ApplicationHelper

  def currently_flagged
    Post.where(flagged: true)
  end
end
