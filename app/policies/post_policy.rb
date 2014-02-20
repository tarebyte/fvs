class PostPolicy

  def initialize(user, post)
    user ||= User.new
    @user = user
    @post = post
  end

  def flagged?
    @user.admin?
  end

  def create?
    @user.persisted?
  end

  def new?  ; create? end
  def flag? ; create? end

  def edit?
    @post.author_id == @user.id or @user.admin?
  end

  def update?  ; edit? end
  def destroy? ; edit? end
end
