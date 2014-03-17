class PostsController < ApplicationController
  before_filter :set_post, only: [:show, :flag, :unflag, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show, :equipment]

  def index
    @users = User.last(10).reverse
    @posts = Post.last(10).reverse
  end

  def equipment
    @posts = Post.search('equipment')
      .records.where(flagged: false)
      .paginate(page: params[:page])

    render action: 'index'
  end

  def show
  end

  def flagged
    @posts = Post.where(flagged: true).paginate(page: params[:page]).order('created_at DESC')
    authorize @posts
  end

  def flag
    authorize @post
    @flagged_posts_count = Post.where(flagged: true).count
    if !@post.flagged
      if @post.update_attribute(:flagged, true)
        respond_to do |format|
          format.html { redirect_to listings_path }
          format.json { head :no_content }
          format.js   { render layout: false }
        end
      end
    else
      flash[:error] = "This listing has already been flagged"
    end
  end

  def unflag
    authorize @post
    @flagged_posts_count = Post.where(flagged: true).count
    if @post.flagged
      if @post.update_attribute(:flagged, false)
        respond_to do |format|
          format.html { redirect_to listings_path }
          format.json { head :no_content }
          format.js   { render layout: false }
        end
      end
    else
      flash[:error] = "This listing has is not flagged"
    end
  end

  def new
    @user = User.find(params[:user_id])

    if @user.id != current_user.id
      flash[:error] = "You are not authorized to perform this action"
      redirect_to listings_path
    end

    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    authorize @post

    respond_to do |format|
      if @post.save!
        format.html { redirect_to listings_path }
        format.js
      else
        format.html { redirect_to :back, alert: 'Listing Failed to be created' }
      end
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(params[:post].permit(:title, :content))
      flash[:notice] = "Listing was successfully updated"
      redirect_to listings_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize @post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to listings_path }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
