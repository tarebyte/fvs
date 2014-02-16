class PostsController < ApplicationController
  before_filter :set_post, only: [:edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show, :create]

  def index
    @post = Post.new
    @posts = Post.where(flagged: false).paginate(page: params[:page]).order('created_at ASC')
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

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
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
