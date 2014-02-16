class PostPolicy

  def initialize(user, post)
    user ||= User.new
    @user = user
    @post = post
  end

  def index?   ; !@post.flagged? unless @user.admin? end
  def show?    ; show                                end

  def create? ; @user.persisted? end
  def new?    ; create?          end

  def update?  ; @post.author_id == user.id  end
  def edit?    ; update?                     end
  def destroy? ; update?                     end
end
